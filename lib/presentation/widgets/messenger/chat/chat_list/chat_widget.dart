import 'package:TalkSpace/domain/model/entities/chat_with_count_and_last_message.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_view_model.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_list/chat_input_text.dart';
import '../messages_list/messages_list.dart';
import 'package:TalkSpace/shared/error_modal.dart';
import 'package:TalkSpace/shared/loading_modal.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatWidget extends StatefulWidget {
  final ChatWithCountAndLastMessage chat;

  const ChatWidget({
    super.key,
    required this.chat,
  });

  @override
  State<StatefulWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      try {
        ChatViewModel chatViewModel = Provider.of<ChatViewModel>(context, listen: false);
        await chatViewModel.initChat(widget.chat.id);
        chatViewModel.chatMessageManager?.controller.stream.handleError((e) {
          showUnsuccessToast("Ошибка соединения");
        });
      } catch (e) {
        showUnsuccessToast("Ошибка соединения");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Consumer<ChatViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) return const LoadingModal();
                if (viewModel.isError) return ErrorModal(callback: () => viewModel.initChat(widget.chat.id));
                return ChatList(chat: widget.chat);
              }
          ),
        ),
        ChatInputText(chat: widget.chat),
      ],
    );
  }
}
