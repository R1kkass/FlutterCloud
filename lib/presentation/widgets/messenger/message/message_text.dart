import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  final String text;

  const MessageText({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}