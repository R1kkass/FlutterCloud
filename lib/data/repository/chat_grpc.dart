import 'dart:async';

import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pbgrpc.dart';
import 'package:TalkSpace/services/dh_algoritm.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:grpc/grpc.dart';

import 'interceptors/auth_interceptor.dart';

class ChatGrpc extends BaseGrpc {
  late final _stub = ChatGreeterClient(channel, interceptors: [AuthInterceptor()]);

  Future<CreateResponseChat> createChat(CreateRequestChat request) async {
    CreateResponseChat response =
        await _stub.createChat(request);
    var p = response.keys.p;
    var g = response.keys.g;
    var chatId = response.chatId;

    var A = await DHAlgorithm.generatePubKey(p, g.toInt(), chatId);
    String key = A.toString();

    await createSecondaryKey(
        CreateSecondaryKeyRequest(chatId: chatId, key: key));
    return response;
  }

  Future<StreamSubscription<StreamGetResponseChat>> streamGetChat(void Function(StreamGetResponseChat) onData) {
    return listen(_stub.streamGetChat(Empty()), onData);
  }

  Future<GetUnSuccessChatsResponse> getUnSuccessChats() async {
    return retry(() => _stub.getUnSuccessChats(Empty()));
  }

  Future<CreateSecondaryKeyResponse> createSecondaryKey(
      CreateSecondaryKeyRequest request) async {
    CreateSecondaryKeyResponse response =
        await _stub.createSecondaryKey(request);
    return response;
  }

  Future<GetPublicKeyResponse> getPublicKey(GetPublicKeyRequest request) async {
    GetPublicKeyResponse response =
        await _stub.getPublicKey(request);
    return response;
  }

  Future<GetSecondaryKeyResponse> getSecondaryKey(
      GetSecondaryKeyRequest request) async {
    GetSecondaryKeyResponse response =
      await retry(() => _stub.getSecondaryKey(request));
    return response;
  }

  Future<AcceptChatResponse> acceptChat(AcceptChatRequest request) async {
    AcceptChatResponse response =
        await retry(() => _stub.acceptChat(request));
    return response;
  }

  Future<DisallowChatResponse> disallowChat(DisallowChatRequest request) async {
    DisallowChatResponse response =
      await retry(() =>  _stub.disallowChat(request));
    return response;
  }

  Future<GetMessagesResponse> getMessages(GetMessagesRequest request) async {
    GetMessagesResponse response =
      await retry(() => _stub.getMessages(request));
    return response;
  }

  Future<StreamSubscription<StreamGetMessagesGeneralResponse>> streamGetMessagesGeneral(void Function(StreamGetMessagesGeneralResponse) onData) async {
    return await listen(_stub.streamGetMessagesGeneral(Empty()), onData);
  }

  Future<StreamSubscription<StreamGetMessagesResponse>> streamGetMessages(
      Stream<StreamGetMessagesRequest> request, String chatId, void Function(StreamGetMessagesResponse) onData) {
    return listen(_stub.streamGetMessages(request,
        options: CallOptions(metadata: {
          "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
          "chat_id": chatId
        })), onData);
  }
}
