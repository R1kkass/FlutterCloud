import 'dart:math';

import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/chat_files_column.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/message_actions.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/message_date_created.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/message_text.dart';
import 'package:flutter/material.dart';

class MessageComponent extends StatelessWidget {
  const MessageComponent({
    super.key,
    required this.isCurrentUser,
    required this.message,
    required this.icon
  });

  final bool isCurrentUser;
  final Message message;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    DateTime time = message.createdAt.toLocal();
    String text = message.text;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) {
          return MessageActions(
            message: message,
          );
        });
      },
      child: Container(
        alignment: isCurrentUser ? Alignment.topRight : Alignment.topLeft,
        child: ClipPath(
          clipper: isCurrentUser ? MyCustomClipper() : OtherCustomClipper(),
          child: IntrinsicWidth(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width - 70,
                  minWidth: 170),
              padding: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? Colors.blueAccent
                    : Colors.deepOrange.shade400,
              ),
              child: Column(
                children: [
                  if (!isCurrentUser)
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, left: 15, right: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Text(
                                message.user.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ]),
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  ChatFilesColumn(
                      message: message,
                      status: isCurrentUser
                  ),
                  if (text != "")
                    MessageText(text: text),
                  MessageDateCreated(
                    time: time,
                    statusIcon: icon,
                  )
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var radius = 40.0;

    Path path = Path()
      ..moveTo(0, 0)
      ..arcTo(
          Rect.fromPoints(Offset(size.width - radius, 5),
              Offset(size.width, radius)), // Rect
          1.5 * pi, // начальный угол
          0.5 * pi, // конечный угол
          true) // направление по часовой стрелке
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - 20, size.height - 20), radius: 20),
          0,
          0.5 * pi,
          false)
      ..arcTo(Rect.fromLTRB(5, size.height - radius, radius, size.height),
          0.5 * pi, 0.4 * pi, false)
      ..arcTo(const Rect.fromLTWH(5, 5, 40, 40), 1 * pi, 0.5 * pi, false)
      ..addPolygon([
        Offset(size.width, size.height),
        Offset(size.width - 80, size.height - 20),
        Offset(size.width - 20, size.height - 40),
      ], true)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class OtherCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var radius = 40.0;

    Path path = Path()
      ..moveTo(0, 0)
      ..addPolygon([
        Offset(4, size.height),
        Offset(30, size.height - 70),
        Offset(70, size.height - 20),
      ], true)
      ..arcTo(
          Rect.fromPoints(Offset(size.width - radius, 5),
              Offset(size.width, radius)), // Rect
          1.5 * pi, // начальный угол
          0.5 * pi, // конечный угол
          true) // направление по часовой стрелке
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - 20, size.height - 20), radius: 20),
          0,
          0.5 * pi,
          false)
      ..arcTo(Rect.fromLTRB(5, size.height - radius, radius, size.height),
          0.5 * pi, 0.4 * pi, false)
      ..arcTo(const Rect.fromLTWH(5, 5, 40, 40), 1 * pi, 0.5 * pi, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
