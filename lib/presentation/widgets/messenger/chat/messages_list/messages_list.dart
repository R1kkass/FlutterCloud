import 'package:TalkSpace/domain/model/entities/chat_with_count_and_last_message.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/notification_scroll_view_model.dart';
import './animated_chat_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatList extends StatefulWidget {
  final ChatWithCountAndLastMessage chat;

  const ChatList({
    required this.chat,
    super.key,
  });

  @override
  State createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationScrollViewModel>(
      builder: (context, viewModel, child) {
        return NotificationListener(
          onNotification: (t) {
            return viewModel.notificationScroll(t, widget.chat.id);
          },
          child: AnimatedChatList(),
        );
      }
    );
  }
}
