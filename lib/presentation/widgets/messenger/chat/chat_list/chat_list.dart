import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_list_messages_view_model.dart';
import 'package:TalkSpace/shared/error_modal.dart';
import 'package:TalkSpace/shared/loading_modal.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_list/chat_unit_list.dart';
import 'package:provider/provider.dart';

class ChatListMessages extends StatefulWidget {
  const ChatListMessages({super.key});

  @override
  State<ChatListMessages> createState() => _ChatListMessagesGeneralState();
}

class _ChatListMessagesGeneralState extends State<ChatListMessages> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((e) async {
      try {
        var stream = await Provider.of<ChatListMessagesViewModel>(context, listen: false).streamGetChats();
        stream?.onError((e) {
          showUnsuccessToast("Ошибка соединения");
        });
      } catch (e) {
        showUnsuccessToast("Ошибка соединения");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatListMessagesViewModel>(builder: (context, viewModel, child) {
      if (viewModel.isLoading) LoadingModal();

      if (viewModel.isError) ErrorModal();

      if (viewModel.chats.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.message_outlined, size: 80,),
            Text("У вас нет чатов", style: TextStyle(fontSize: 28, color: Colors.deepOrange.shade400, fontWeight: FontWeight.bold),)
          ],
        );
      }

      return ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
        for (var item in viewModel.chats)
          ChatUnitList(
            chat: item,
          )
      ]);
    });
  }
}
