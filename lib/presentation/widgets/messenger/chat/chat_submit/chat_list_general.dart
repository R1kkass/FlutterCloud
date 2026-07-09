import 'package:TalkSpace/presentation/viewmodels/messenger/chat/chat_submit/common_chat_submit.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_submit/chat_accept.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_submit/error_chats_load_for_submit.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_submit/not_found_chats_for_submit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatListGeneral extends StatefulWidget {
  const ChatListGeneral({super.key});

  @override
  State<ChatListGeneral> createState() => _ChatListGeneralState();
}

class _ChatListGeneralState extends State<ChatListGeneral> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      await Provider.of<CommonChatAcceptDisallow>(context, listen: false).update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonChatAcceptDisallow>(
      builder: (context, viewModel, child) {
        return RefreshIndicator(
          onRefresh: () async {
            await Provider.of<CommonChatAcceptDisallow>(context, listen: false).update();
          },
          child: Builder(
            builder: (BuildContext context) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (viewModel.isError) {
                return ErrorChatLoadForSubmit();
              } else if (viewModel.chats.isEmpty) {
                return NotFoundChatsForSubmit();
              }
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: viewModel.chats.length,
                itemBuilder: (context, index) {
                  return ChatAccept(chat: viewModel.chats[index]);
              });
            },
          ),
        );
      },
    );
  }
}
