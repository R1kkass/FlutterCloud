import 'dart:async';

import 'package:TalkSpace/data/sources/local/chat_secret_keys_local_data_source.dart';
import 'package:TalkSpace/domain/repository/chat_message_manager.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/index.dart';

class ChatMessageManagerGrpc implements ChatMessageManager {
  @override
  StreamController<StreamGetMessagesRequest> controller;

  @override
  int chatId;
  ChatSecretKeysLocalDataSource chatSecretKeysLocalDataSource;
  @override
  StreamSubscription<dynamic> currentStream;

  ChatMessageManagerGrpc({
    required this.controller,
    required this.chatId,
    required this.chatSecretKeysLocalDataSource,
    required this.currentStream
  });

  @override
  addMessage(String text) {
    var secretKey = chatSecretKeysLocalDataSource.getSecretKey(chatId) ?? "";
    var hashText = EncryptMessage().encrypt(text, secretKey).base64;
    controller.add(StreamGetMessagesRequest(
        text: hashText, type: TypeMessage.SEND_MESSAGE));
  }

  @override
  readAll() {
    controller.add(StreamGetMessagesRequest(type: TypeMessage.READ_MESSAGE_ALL));
  }

  @override
  readMessage(int messageId) {
    controller.add(StreamGetMessagesRequest(
        messageId: messageId, type: TypeMessage.READ_MESSAGE));
  }

  @override
  addUploadFile(int messageId) {
    controller.add(StreamGetMessagesRequest(
      type: TypeMessage.UPLOAD_MESSAGE,
      messageId: messageId
    ));
  }

  @override
  void cancel() async {
    await currentStream.cancel();
  }
}
