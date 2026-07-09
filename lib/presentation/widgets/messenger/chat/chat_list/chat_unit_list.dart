import 'package:TalkSpace/domain/model/entities/chat_with_count_and_last_message.dart';
import 'package:TalkSpace/presentation/views/chat.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_list/last_message_text.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/services/index.dart';

class ChatUnitList extends StatefulWidget {
  final ChatWithCountAndLastMessage chat;

  const ChatUnitList({super.key, required this.chat});

  @override
  State<ChatUnitList> createState() => _ChatUnitListState();
}

class _ChatUnitListState extends State<ChatUnitList> {

  String get chatName {
    var chat = widget.chat;
    return chat.nameChat == ""
        ? jwtDecode().email != chat.users[0].email
        ? chat.users[0].name
        : chat.users[1].name
        : chat.nameChat;
  }

  @override
  Widget build(BuildContext context) {
    ChatWithCountAndLastMessage chat = widget.chat;
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
                arguments: ChatArgument(chat: widget.chat));
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
                      chatName,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent.shade400),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                 LastMessageText(chat: chat),
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
