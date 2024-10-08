import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/month.dart';

class MessageComponent extends StatefulWidget {
  const MessageComponent(
      {super.key,
      required this.status,
      required this.text,
      required this.createdAt,
      required this.name,
      required this.dateChange});

  final bool status;
  final DateTime? dateChange;
  final String text;
  final String createdAt;
  final String name;

  @override
  State<MessageComponent> createState() => _MessageComponentState();
}

class _MessageComponentState extends State<MessageComponent> {
  @override
  Widget build(BuildContext context) {
    DateTime? dateChange = widget.dateChange;
    DateTime time = DateTime.parse(widget.createdAt).toLocal();
    return Column(
      children: [
        dateChange != null
            ? SizedBox(
                height: 30,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 0.5, bottom: 0.5, left: 5, right: 5),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(66, 41, 41, 41),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text(
                      "${dateChange.day} ${month[dateChange.month]}",
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              )
            : const SizedBox(
                height: 0,
              ),
        Container(
            alignment: widget.status ? Alignment.topRight : Alignment.topLeft,
            child: ClipPath(
              clipper: widget.status ? MyCustomClipper() : OtherCustomClipper(),
              child: IntrinsicWidth(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width / 1.5,
                      minWidth: 170),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  color: widget.status
                      ? Colors.blueAccent
                      : Colors.deepOrange.shade400,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                      Container(
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
                        alignment: Alignment.topRight,
                        child: Text(
                          "${time.hour}:${time.minute > 9 ? time.minute : "0${time.minute}"}",
                          style: const TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w700,
                              fontSize: 10),
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
        Offset(size.width - 20, size.height - 80),
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
        Offset(30, size.height - 80),
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
