import 'dart:async';

import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/data/repository/chat_message_manager_grpc.dart';
import 'package:TalkSpace/data/sources/local/chat_public_keys_local_data_source.dart';
import 'package:TalkSpace/data/sources/local/chat_secret_keys_local_data_source.dart';
import 'package:TalkSpace/domain/model/entities/chat_with_count_and_last_message.dart';
import 'package:TalkSpace/domain/model/entities/keys.dart' as k;
import 'package:TalkSpace/domain/model/response/chat/stream_get_chats_response.dart';
import 'package:TalkSpace/domain/model/response/chat/stream_get_messages_response.dart' as tp;
import 'package:TalkSpace/domain/model/request/get_messages_request.dart' as g;
import 'package:TalkSpace/domain/model/response/chat/create_chat_response.dart';
import 'package:TalkSpace/domain/model/response/chat/get_messages_response.dart' as gmr;
import 'package:TalkSpace/domain/model/response/chat/un_success_chats_response.dart';
import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:TalkSpace/domain/repository/chat_message_manager.dart';
import 'package:TalkSpace/domain/repository/keys_repository.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pbgrpc.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:grpc/grpc.dart';

import 'interceptors/auth_interceptor.dart';

class ChatGrpc extends BaseGrpc implements ChatRepository {
  late final _stub = ChatGreeterClient(channel, interceptors: [AuthInterceptor()]);
  ChatSecretKeysLocalDataSource chatSecretKeysLocalDataSource;
  ChatPublicKeysLocalDataSource chatPublicKeysLocalDataSource;
  KeysRepository keysRepository;

  ChatGrpc({
    required this.chatSecretKeysLocalDataSource,
    required this.chatPublicKeysLocalDataSource,
    required this.keysRepository,
  });

  @override
  Future<CreateChatResponse> createChat(String companionUuid) async {
    CreateResponseChat response =
        await retry(() async => _stub.createChat(CreateRequestChat(
          companionUuid: companionUuid,
        )));
    var p = response.keys.p;
    var g = response.keys.g;
    var chatId = response.chatId;

    var publicKeys = await DHAlgorithm.generatePubKey(p, g.toString());
    chatPublicKeysLocalDataSource.addPublicKey(chatId, publicKeys["a"]!);
    String key = publicKeys["A"].toString();

    await createSecondaryKey(chatId, key);
    return CreateChatResponse.fromGRPC(response);
  }

  @override
  Future<StreamSubscription<dynamic>> streamGetChat(void Function(StreamGetChatsResponse) onData) {
    return listen<StreamGetResponseChat>(_stub.streamGetChat(Empty()), (data) async {
      List<ChatWithCountAndLastMessage> chats = [];
      for (var dataChat in data.chats) {
        var chat = ChatWithCountAndLastMessage.fromGrpc(dataChat);
        var hash = await _readDownloadKeys(dataChat.id);
        chat.message.text = EncryptMessage().decrypt(dataChat.message.text, hash ?? "");
        chats.add(chat);
      }
      onData(StreamGetChatsResponse(chats: chats));
    });
  }

  @override
  Future<UnSuccessChatsResponse> getUnSuccessChats() async {
    return retry(() async => UnSuccessChatsResponse.fromGRPC(await _stub.getUnSuccessChats(Empty())));
  }

  @override
  Future<void> createSecondaryKey(int chatId, String key) async {
    await retry(() async => _stub.createSecondaryKey(CreateSecondaryKeyRequest(chatId: chatId, key: key)));
  }

  @override
  Future<k.Keys> getPublicKey(int chatId) async {
    GetPublicKeyResponse response = await retry(() async => _stub.getPublicKey(GetPublicKeyRequest(chatId: chatId)));
    return k.Keys(key: response.g.toString(), p: response.p);
  }

  @override
  Future<k.Keys> getSecondaryKey(int chatId) async {
    GetSecondaryKeyResponse response = await retry(() => _stub.getSecondaryKey(GetSecondaryKeyRequest(chatId: chatId)));
    return k.Keys(key: response.key, p: response.p);
  }

  @override
  Future<void> acceptChat(int chatId) async {
    await createSecretChatKey(chatId);
    await retry(() => _stub.acceptChat(AcceptChatRequest(chatId: chatId)));
  }

  @override
  Future<void> disallowChat(int chatId) async {
    await retry(() => _stub.disallowChat(DisallowChatRequest(chatId: chatId)));
  }

  @override
  Future<gmr.GetMessagesResponse> getMessages(g.GetMessagesRequest request) async {
    GetMessagesResponse response =
      await retry(() => _stub.getMessages(GetMessagesRequest(
          page: request.page,
          chatId: request.chatId,
          init: request.init,
      )));
    var hash = await _readDownloadKeys(request.chatId);
    for (var message in response.messages) {
      message.text = EncryptMessage().decrypt(message.text, hash ?? "");
      for (var messageFile in message.messageFiles) {
        messageFile.fileName = EncryptMessage().decrypt(messageFile.fileName, hash ?? "");
      }
    }
    return gmr.GetMessagesResponse.fromGRPC(response);
  }

  @override
  Future<StreamSubscription> streamGetMessagesGeneral(void Function(int) onData) async {
    return listen(_stub.streamGetMessagesGeneral(Empty()), (data) => onData(data.count));
  }
  @override
  Future<ChatMessageManager> streamGetMessages(int chatId, void Function(tp.StreamGetMessagesResponse) onData) async {
    StreamController<StreamGetMessagesRequest> controller = StreamController();

    var hash = await _readDownloadKeys(chatId);
    var stream = await listen(_stub.streamGetMessages(controller.stream,
        options: CallOptions(metadata: {
          "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
          "chat_id": chatId.toString()
        })),
        (data) async {
          for (var message in data.messages) {
            message.text = EncryptMessage().decrypt(message.text, hash ?? "");
            for (var messageFile in message.messageFiles) {
              messageFile.fileName = EncryptMessage().decrypt(messageFile.fileName, hash ?? "");
            }
          }

          var message = data.message;
          message.text = EncryptMessage().decrypt(data.message.text, hash ?? "");
          for (var messageFile in message.messageFiles) {
            messageFile.fileName = EncryptMessage().decrypt(messageFile.fileName, hash ?? "");
          }

          onData(tp.StreamGetMessagesResponse.fromGRPC(StreamGetMessagesResponse(
            messages: data.messages,
            type: data.type,
            message: message,
          )));
        }
    );

    return ChatMessageManagerGrpc(controller: controller, chatId: chatId, chatSecretKeysLocalDataSource: chatSecretKeysLocalDataSource, currentStream: stream);
  }

  @override
  Future<String> createSecretChatKey(int chatId) async {
    var secretHashKey = chatSecretKeysLocalDataSource.getSecretKey(chatId);
    if (secretHashKey == null) {
      if (chatPublicKeysLocalDataSource.getPubKey(chatId) == null) {
        k.Keys keys = await getPublicKey(chatId);
        var publicKeys = await DHAlgorithm.generatePubKey(keys.p, keys.key);

        await chatPublicKeysLocalDataSource.addPublicKey(chatId, publicKeys["a"]!);
        String key = publicKeys["A"].toString();
        await createSecondaryKey(chatId, key.toString());
      }
      var keys = await getSecondaryKey(chatId);
      var alicePrivateKey = chatPublicKeysLocalDataSource.getPubKey(chatId)!;
      secretHashKey = await DHAlgorithm.generateSecretKey(alicePrivateKey, keys.key, keys.p);

      await chatSecretKeysLocalDataSource.addSecretKey(chatId, secretHashKey);
    }
    await keysRepository.uploadNewKeys();

    return secretHashKey;
  }

  Future<String?> _readDownloadKeys(int chatId) async {
    if (chatSecretKeysLocalDataSource.getSecretKey(chatId) == null) {
      await keysRepository.getKeys();
    }

    if (chatSecretKeysLocalDataSource.getSecretKey(chatId) == null) {
      await createSecretChatKey(chatId);
    }

    return chatSecretKeysLocalDataSource.getSecretKey(chatId);
  }
}
