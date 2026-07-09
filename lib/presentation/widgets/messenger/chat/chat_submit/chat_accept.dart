import 'package:TalkSpace/domain/model/entities/chat.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_submit/chat_disallow_button.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_submit/chat_accept_button.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/services/jwt_decode.dart';

abstract class ChatAcceptImpl extends StatefulWidget{
  final Chat chat;

  const ChatAcceptImpl({super.key, required this.chat});
}

class ChatAccept extends ChatAcceptImpl {

  const ChatAccept({super.key, required super.chat});

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
              chat.nameChat == ""
                  ? jwt?.email != chat.users[0].email
                      ? chat.users[0].name
                      : chat.users[1].name
                  : chat.nameChat,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            ChatAcceptButton(chat: chat),
            ChatDisallowButton(chat: chat)
          ],
        ),
      ),
    );
  }
}
