import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/enums/message_status_enum.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_view_model.dart';
import './message_animation_transform.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedChatList extends StatefulWidget {
  const AnimatedChatList({super.key});

  @override
  State<AnimatedChatList> createState() => _AnimatedChatListState();
}

class _AnimatedChatListState extends State<AnimatedChatList> {
  Widget iconForMessage(Message message) {
    IconData icon = Icons.done;
    Color color = Colors.white60;

    if (message.status == MessageStatusEnum.success) {
      icon = message.statusRead ? Icons.done_all : Icons.done;
    }
    if (message.status == MessageStatusEnum.uploading) {
      icon = Icons.watch_later_outlined;
    }
    if (message.status == MessageStatusEnum.error) {
      color = Colors.red;
      icon = Icons.error;
    }
    return Icon(
      icon,
      color: color,
      size: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
      builder: (context, viewModel, child) {
        Map<int, DateTime> dataWithDate = {};
        DateTime? time;
        int? newMessage;

        for (var item in viewModel.messages.messages.reversed) {
          var timeParse = item.createdAt.toLocal();
          if ("${time?.day}${time?.month}${time?.year}" !=
              "${timeParse.day}${timeParse.month}${timeParse.year}") {
            time = timeParse;
            dataWithDate[item.id] = timeParse;
          }
          if (item.runtimeType == Message &&
              newMessage == null &&
              item.user.email != jwtDecode().email) {
            newMessage = item.id;
          }
        }

        return AnimatedList(
          controller: viewModel.scrollController,
          key: viewModel.key,
          initialItemCount: viewModel.messages.length,
          reverse: true,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index, animation) {
            if (index < viewModel.messages.uploadMessages.length) {
              var message = viewModel.messages.uploadMessages[index];
              return MessageAnimationTransform(
                message: message,
                animation: animation,
                icon: iconForMessage(message),
              );
            }

            index = index - viewModel.messages.uploadMessages.length;

            var message = viewModel.messages.messages[index];
            return MessageAnimationTransform(
              message: message,
              animation: animation,
              icon: iconForMessage(message),
            );
          });
      },
    );
  }
}
