import 'package:flutter/material.dart';

class MessageDateCreated extends StatelessWidget {
  final DateTime time;
  final Widget statusIcon;

  const MessageDateCreated({
    super.key,
    required this.time,
    required this.statusIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          statusIcon,
        ],
      ),
    );
  }
}