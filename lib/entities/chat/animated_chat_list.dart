import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/message.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';

class AnimatedChatList extends StatefulWidget {
  const AnimatedChatList(
      {super.key,
      required this.data,
      required this.keyChat,
      required this.controller,
      required this.globalKey});

  final List<dynamic> data;
  final String keyChat;
  final ScrollController controller;
  final GlobalKey globalKey;

  @override
  State<AnimatedChatList> createState() => _AnimatedChatListState();
}

class _AnimatedChatListState extends State<AnimatedChatList> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> data = widget.data;
    Map<int, DateTime> dataWithDate = {};
    DateTime? time;
    for (var (key, item) in data.reversed.indexed) {
      if (item.runtimeType == Message) {
        item = {
          "id": item.id,
          "created_at": item.createdAt,
          "updated_at": item.updatedAt,
          "chat_id": item.chatId,
          "user": {
            "id": item.user.id,
            "name": item.user.name,
            "email": item.user.email,
          },
          "text": item.text,
          "user_id": item.userId
        };
        data[data.length - key - 1] = item;
      }

      var timeParse = DateTime.parse(item["created_at"]);
      if ("${time?.day}${time?.month}" !=
          "${timeParse.day}${timeParse.month}") {
        time = timeParse;
        dataWithDate[item["id"]] = timeParse;
      }
    }

    return AnimatedList(
        controller: widget.controller,
        key: widget.globalKey,
        initialItemCount: data.length,
        reverse: true,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index, animation) {
          var id = data[index]["id"];

          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              key: UniqueKey(),
              sizeFactor: animation,
              child: MessageComponent(
                dateChange: dataWithDate[id],
                createdAt: data[index]["created_at"],
                name: data[index]["user"]["name"],
                status: jwtDecode().email == data[index]["user"]?["email"],
                text: EncryptMessage()
                    .decrypt(data[index]["text"], widget.keyChat),
              ),
            ),
          );
        });
  }
}
