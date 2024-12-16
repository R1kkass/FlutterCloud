import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/month.dart';
import 'package:flutter_application_2/entities/chat/message_badge.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/widget/chat/chat_files_column.dart';
import 'package:flutter_application_2/widget/chat/chat_files_column_upload.dart';

class MessageUploadFileComponent extends StatefulWidget {
  const MessageUploadFileComponent(
      {super.key,
      required this.secretKey,
      required this.text,
      required this.createdAt,
      required this.name,
      required this.controller,
      required this.chatFiles,
      required this.dateChange});

  final DateTime? dateChange;
  final List<ChatFile> chatFiles;
  final String text;
  final ScrollController controller;
  final String createdAt;
  final String secretKey;
  final String name;

  @override
  State<MessageUploadFileComponent> createState() => MessageUploadFileState();
}

class MessageUploadFileState extends State<MessageUploadFileComponent> {
  @override
  Widget build(BuildContext context) {
    DateTime? dateChange = widget.dateChange;
    DateTime time = DateTime.parse(widget.createdAt).toLocal();
    return Column(
      children: [
        dateChange != null
            ? MessageBadge(text: "${dateChange.day} ${month[dateChange.month]}")
            : const SizedBox(
                height: 0,
              ),
        Container(
            alignment: Alignment.topRight,
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: IntrinsicWidth(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 70,
                      minWidth: 170),
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                    children: [
                      ChatFilesUploadColumn(
                          chatFiles: widget.chatFiles,
                          status: true),
                      if (widget.text != "")
                        Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.text,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(right: 10, top: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${time.hour}:${time.minute > 9 ? time.minute : "0${time.minute}"}",
                              style: const TextStyle(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.access_time_rounded,
                              size: 14,
                              color: Colors.white60,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
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