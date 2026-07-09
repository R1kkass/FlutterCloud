import 'package:flutter/material.dart';

class MessageBadge extends StatefulWidget {
  final String text;

  const MessageBadge({super.key, required this.text});

  @override
  State<MessageBadge> createState() => _MessageBadgeState();
}

class _MessageBadgeState extends State<MessageBadge> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Container(
          padding:
              const EdgeInsets.only(top: 0.5, bottom: 0.5, left: 5, right: 5),
          decoration: const BoxDecoration(
              color: Color.fromARGB(66, 41, 41, 41),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
        ),
      ),
    );
  }
}
