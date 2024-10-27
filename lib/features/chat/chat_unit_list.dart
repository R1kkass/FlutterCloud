import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/pages/chat.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:hive/hive.dart';

class ChatUnitList extends StatefulWidget {
  final ChatUsersCount chat;

  const ChatUnitList({super.key, required this.chat});

  @override
  State<ChatUnitList> createState() => _ChatUnitListState();
}

class _ChatUnitListState extends State<ChatUnitList> {
  JwtPayload? jwt;
  String decryptMessage = "";

  void decryptMessageFn(ChatUsersCount chat) async {
    jwt = jwtDecode();
    var box = Hive.box('secretkey');
    var hash = box.get(widget.chat.chatId.toString() + jwt?.email) ?? "";
    decryptMessage = chat.chat.message.text != ""
        ? EncryptMessage().decrypt(chat.chat.message.text, hash)
        : "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ChatUsersCount chat = widget.chat;
    decryptMessageFn(chat);
    return SizedBox(
      height: 60,
      child: Material(
        elevation: 5.0,
        child: TextButton(
          style: ButtonStyle(
              textStyle:
                  WidgetStateProperty.all(const TextStyle(color: Colors.black)),
              shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ))),
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.CHAT,
                arguments: ChatArgument(chatId: widget.chat.chatId));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 80,
                    child: Text(
                      chat.chat.nameChat == ""
                          ? jwt?.email != chat.chat.chatUsers[0].user.email
                              ? chat.chat.chatUsers[0].user.name
                              : chat.chat.chatUsers[1].user.name
                          : chat.chat.nameChat,
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 60,
                    child: Text(
                      decryptMessage,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
              chat.unReadedMessagesCount != 0
                  ? Badge.count(
                      count: chat.unReadedMessagesCount,
                      backgroundColor: Colors.blueAccent,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
