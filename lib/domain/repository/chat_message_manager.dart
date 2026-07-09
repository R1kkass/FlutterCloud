import 'dart:async';

abstract class ChatMessageManager {
  StreamController<dynamic> get controller;
  int get chatId;
  StreamSubscription<dynamic> get currentStream;

  addMessage(String text);

  readAll();

  readMessage(int messageId);

  addUploadFile(int messageId);

  cancel();
}
