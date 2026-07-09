import 'package:TalkSpace/domain/model/entities/chat_with_count_and_last_message.dart';
import 'package:flutter/material.dart';

class LastMessageText extends StatelessWidget {
  final ChatWithCountAndLastMessage chat;

  const LastMessageText({
    super.key,
    required this.chat,
  });

  String number() {
    if (chat.message.messageFiles.length >= 5) {
      return "ов";
    }

    if (chat.message.messageFiles.length == 1) {
      return "";
    }
    return "а";
  }

  getText() {
    if (chat.message.text == "") {
      return "📎 ${chat.message.messageFiles.length} файл${number()}";
    }
    return chat.message.text;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 100,
      child: Text(
        getText(),
        style: TextStyle(fontSize: 16, color: Colors.blueAccent),
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }
}