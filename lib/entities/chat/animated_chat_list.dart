import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/message.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';

class AnimatedChatList extends StatefulWidget {
  const AnimatedChatList(
      {super.key,
      required this.data,
      required this.keyChat,
      required this.globalKey});

  final List<dynamic> data;
  final String keyChat;
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

    for (var item in data.reversed) {
      var timeParse = DateTime.parse(item["created_at"]);
      if ("${time?.day}${time?.month}" !=
          "${timeParse.day}${timeParse.month}") {
        time = timeParse;
        dataWithDate[item["id"]] = timeParse;
      }
    }

    return AnimatedList(
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
                text: decrypt(data[index]["text"], widget.keyChat),
              ),
            ),
          );
        });
  }
}
