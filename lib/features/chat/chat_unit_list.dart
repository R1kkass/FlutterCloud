import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/pages/chat.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/encrypt_message.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:TalkSpace/services/message_date.dart';

class ChatUnitList extends StatefulWidget {
  final ChatWithUnReadingMessagesCount chat;

  const ChatUnitList({super.key, required this.chat});

  @override
  State<ChatUnitList> createState() => _ChatUnitListState();
}

class _ChatUnitListState extends State<ChatUnitList> {
  String email = "";
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

  void decryptMessageFn(ChatWithUnReadingMessagesCount chat) async {
    email = jwtDecode().email;
    var box = HiveBoxes.chatsSecretKey;
    var hash = box.get(email)?[widget.chat.id.toString()] ?? "";
    if (chat.message.text != "") {
      decryptMessage = EncryptMessage().decrypt(chat.message.text, hash);
    } else if (chat.message.messageFiles.isNotEmpty) {
      var countFiles = chat.message.messageFiles.length;
      decryptMessage = "📎 $countFiles файл${number(countFiles)}";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ChatWithUnReadingMessagesCount chat = widget.chat;
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
                arguments: ChatArgument(chatId: widget.chat.id));
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
                      chat.nameChat == ""
                          ? email != chat.users[0].email
                              ? chat.users[0].name
                              : chat.users[1].name
                          : chat.nameChat,
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
                      if (chat.message.user.email == jwtDecode().email)
                        chat.message.statusRead
                            ? const Icon(Icons.done_all,
                                size: 16, color: Colors.blueAccent)
                            : const Icon(Icons.done,
                                size: 14, color: Colors.blueAccent),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        MessageDate().date(widget.chat.message.createdAt),
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black45),
                      ),
                    ],
                  ),
                  const Spacer(),
                  chat.unReadingMessagesCount != 0
                      ? Badge(
                          label: Text(chat.unReadingMessagesCount > 99
                              ? "99+"
                              : "${chat.unReadingMessagesCount}"),
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
