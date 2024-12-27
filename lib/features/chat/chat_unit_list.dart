import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/pages/chat.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:TalkSpace/services/encrypt_message.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:TalkSpace/services/message_date.dart';

class ChatUnitList extends StatefulWidget {
  final ChatUsersCount chat;

  const ChatUnitList({super.key, required this.chat});

  @override
  State<ChatUnitList> createState() => _ChatUnitListState();
}

class _ChatUnitListState extends State<ChatUnitList> {
  JwtPayload? jwt;
  String decryptMessage = "";

  String number(int count) {
    if (count >= 5) {
      return "ов";
    }

    if (count == 1) {
      return "";
    }
    return "а";
  }

  void decryptMessageFn(ChatUsersCount chat) async {
    jwt = jwtDecode();
    var box = HiveBoxes.secretKey;
    var hash = box.get(widget.chat.chatId.toString() + jwt?.email) ?? "";
    if (chat.chat.message.text != "") {
      decryptMessage = EncryptMessage().decrypt(chat.chat.message.text, hash);
    } else if (chat.chat.message.chatFiles.isNotEmpty) {
      var countFiles = chat.chat.message.chatFiles.length;
      decryptMessage = "📎 $countFiles файл${number(countFiles)}";
    }

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
                    width: MediaQuery.sizeOf(context).width - 100,
                    child: Text(
                      chat.chat.nameChat == ""
                          ? jwt?.email != chat.chat.chatUsers[0].user.email
                              ? chat.chat.chatUsers[0].user.name
                              : chat.chat.chatUsers[1].user.name
                          : chat.chat.nameChat,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent.shade400),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 100,
                    child: Text(
                      decryptMessage,
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      if (chat.chat.message.user.email == jwtDecode().email)
                        chat.chat.message.statusRead
                            ? const Icon(Icons.done_all,
                                size: 16, color: Colors.blueAccent)
                            : const Icon(Icons.done,
                                size: 14, color: Colors.blueAccent),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        MessageDate().date(widget.chat.chat.message.createdAt),
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black45),
                      ),
                    ],
                  ),
                  const Spacer(),
                  chat.unReadedMessagesCount != 0
                      ? Badge(
                          label: Text(chat.unReadedMessagesCount > 99
                              ? "99+"
                              : "${chat.unReadedMessagesCount}"),
                          backgroundColor: Colors.blueAccent,
                        )
                      : const SizedBox()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
