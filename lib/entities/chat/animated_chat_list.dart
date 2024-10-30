import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/message.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedChatList extends StatefulWidget {
  const AnimatedChatList(
      {super.key,
      required this.data,
      required this.keyChat,
      required this.readCallback,
      required this.controller,
      required this.globalKey});

  final List<Message> data;
  final void Function(int) readCallback;
  final String keyChat;
  final ScrollController controller;
  final GlobalKey globalKey;

  @override
  State<AnimatedChatList> createState() => _AnimatedChatListState();
}

class _AnimatedChatListState extends State<AnimatedChatList> {
  @override
  Widget build(BuildContext context) {
    List<Message> data = widget.data;
    Map<int, DateTime> dataWithDate = {};
    DateTime? time;

    for (var item in data.reversed) {
      if (item.runtimeType == Message) {
        var timeParse = DateTime.parse(item.createdAt);
        if ("${time?.day}${time?.month}" !=
            "${timeParse.day}${timeParse.month}") {
          time = timeParse;
          dataWithDate[item.id] = timeParse;
        }
      }
    }

    return AnimatedList(
        controller: widget.controller,
        key: widget.globalKey,
        initialItemCount: data.length,
        reverse: true,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index, animation) {
          var id = data[index].id;
          return VisibilityDetector(
            key: Key("$id"),
            onVisibilityChanged: (visibilityInfo) {
              if (data[index].unReadedMessage) {
                log(id.toString());
                widget.readCallback(id);
              }
            },
            child: FadeTransition(
              key: ValueKey<int>(id),
              opacity: animation,
              child: SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: MessageComponent(
                  controller: widget.controller,
                  statusRead: data[index].statusRead,
                  dateChange: dataWithDate[id],
                  createdAt: data[index].createdAt,
                  name: data[index].user.name,
                  status: jwtDecode().email == data[index].user.email,
                  text: EncryptMessage()
                      .decrypt(data[index].text, widget.keyChat),
                ),
              ),
            ),
          );
        });
  }
}
