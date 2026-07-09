import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/enums/message_status_enum.dart';
import 'package:flutter/material.dart';

class MessageActions extends StatelessWidget {
  final Message message;

  const MessageActions({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text("Удалить")
          ),
          if (message.status == MessageStatusEnum.error)
            TextButton(
                onPressed: () {},
                child: Text("Повторить")
            ),
        ],
      ),
    );
  }
}