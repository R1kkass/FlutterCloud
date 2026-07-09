import 'dart:async';

import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';

class Messaging {
  addMessage(StreamController controller, String text, TypeMessage typeMessage) {
    controller.add(StreamGetMessagesRequest(
        text: text, type: TypeMessage.SEND_MESSAGE));
  }

  readAll(StreamController controller) {
    controller.add(StreamGetMessagesRequest(type: TypeMessage.READ_MESSAGE_ALL));
  }

  readMessage(StreamController controller, int messageId) {
    controller.add(StreamGetMessagesRequest(
        messageId: messageId, type: TypeMessage.READ_MESSAGE));
  }

  addUploadFile(StreamController controller, int messageId) {
    controller.add(StreamGetMessagesRequest(
        type: TypeMessage.UPLOAD_MESSAGE, messageId: messageId));
  }
}
