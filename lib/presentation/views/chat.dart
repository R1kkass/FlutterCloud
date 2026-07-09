import 'package:TalkSpace/domain/model/entities/chat_with_count_and_last_message.dart';
import 'package:TalkSpace/presentation/providers/chat_provider.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_list/chat_widget.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/chat_float_button.dart';
import 'package:TalkSpace/presentation/widgets/scaffold/default_scaffold.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:flutter/material.dart';

class ChatArgument {
  final ChatWithCountAndLastMessage chat;

  const ChatArgument({
    required this.chat,
  });
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ChatArgument;
    chatName() {
      var chat = args.chat;
      return chat.nameChat == ""
          ? jwtDecode().email != chat.users[0].email
          ? chat.users[0].name
          : chat.users[1].name
          : chat.nameChat;
    }
    return ChatProvider(
      chatId: args.chat.id,
      child: DefaultScaffold(
        floatButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: ChatFloatButton(),
        ),
        title: chatName(),
        body: ChatWidget(
          chat: args.chat,
        ),
      )
    );
  }
}
