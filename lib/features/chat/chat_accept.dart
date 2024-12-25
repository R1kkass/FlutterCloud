
import 'package:TalkSpace/entities/chat/chat_accept_button.dart';
import 'package:TalkSpace/entities/chat/chat_dissalow_button.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:TalkSpace/services/jwt_decode.dart';

abstract class ChatAcceptImpl extends StatefulWidget{
  final ChatUser chat;
  final Function(List<ChatUser>) setChats;

  const ChatAcceptImpl({super.key, required this.chat, required this.setChats});
}

class ChatAccept extends ChatAcceptImpl {

  const ChatAccept({super.key, required super.chat, required super.setChats});

  @override
  State<ChatAccept> createState() => _ChatAcceptState();
}

class _ChatAcceptState extends State<ChatAccept> {
  JwtPayload? jwt;

  @override
  void initState() {
    super.initState();
    jwt = jwtDecode();
  }

  @override
  Widget build(BuildContext context) {
    var chat = widget.chat;
    return Material(
      elevation: 5.0,
      child: TextButton(
        style: ButtonStyle(
            textStyle:
                WidgetStateProperty.all(const TextStyle(color: Colors.black)),
            shape: WidgetStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ))),
        onPressed: () {},
        child: Row(
          children: [
            Text(
              chat.chat.nameChat == ""
                  ? jwt?.email != chat.chat.chatUsers[0].user.email
                      ? chat.chat.chatUsers[0].user.name
                      : chat.chat.chatUsers[1].user.name
                  : chat.chat.nameChat,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            ChatAcceptButton(chat: chat, setChats: widget.setChats),
            ChatDissalowButton(chat: chat, setChats: widget.setChats)
          ],
        ),
      ),
    );
  }


}
