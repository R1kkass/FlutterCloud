import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/pages/chat.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:hive/hive.dart';

class ChatUnitList extends StatefulWidget {
  final ChatUsers chat;

  const ChatUnitList({super.key, required this.chat});

  @override
  State<ChatUnitList> createState() => _ChatUnitListState();
}

class _ChatUnitListState extends State<ChatUnitList> {
  String? token;
  JwtPayload? jwt;
  String decryptMessage = "";
  @override
  void initState() {
    super.initState();
  }

  Future<String> decryptMessageFn(ChatUsers chat) async{
        token = Hive.box('token').get('access_token');
        jwt = jwtDecode();
        var box = await Hive.openBox('secretkey');
        var hash = box.get(widget.chat.chatId.toString() + jwt?.email) ?? "";
        return decrypt(chat.chat.message.text, hash);
  }

  @override
  Widget build(BuildContext context) {
    ChatUsers chat = widget.chat;
    decryptMessageFn(chat);
    
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
                      ? jwt?.email != chat.chat.chatUsers[0].user.email
                          ? chat.chat.chatUsers[0].user.name
                          : chat.chat.chatUsers[1].user.name
                      : chat.chat.nameChat,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700)),
            ]),
            Row(
              children: [
                Text(
                  decryptMessage,
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
