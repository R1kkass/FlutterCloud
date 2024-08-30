import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/pages/chat.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ChatUnitList extends StatefulWidget {
  final ChatUsers chat;

  const ChatUnitList({super.key, required this.chat});

  @override
  State<ChatUnitList> createState() => _ChatUnitListState();
}

class _ChatUnitListState extends State<ChatUnitList> {
  @override
  Widget build(BuildContext context) {
    var token = Hive.box('token').get('access_token');

    var jwtDecode = Jwt.parseJwt(token);

    ChatUsers chat = widget.chat;
    return Material(
      elevation: 5.0,
      child: TextButton(
        style: ButtonStyle(
            textStyle:
                WidgetStateProperty.all(const TextStyle(color: Colors.black)),
            shape: WidgetStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ))),
        onPressed: () {
          Navigator.pushNamed(context, CHAT,
              arguments: ChatArgument(chatId: widget.chat.chatId));
        },
        child: Column(
          children: [
            Row(children: [
              Text(
                  chat.chat.nameChat == ""
                      ? jwtDecode["email"] != chat.chat.chatUsers[0].user.email
                          ? chat.chat.chatUsers[0].user.name
                          : chat.chat.chatUsers[1].user.name
                      : chat.chat.nameChat,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700)),
            ]),
            Row(
              children: [
                Text(
                  chat.chat.message.text,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(chat.chat.id.toString())
              ],
            )
          ],
        ),
      ),
    );
  }
}
