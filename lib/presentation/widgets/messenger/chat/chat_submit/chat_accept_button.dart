import 'package:TalkSpace/presentation/viewmodels/messenger/chat/chat_submit/chat_accept_button_view_model.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_submit/chat_accept.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatAcceptButton extends ChatAcceptImpl {
  const ChatAcceptButton(
      {super.key, required super.chat});

  @override
  State<ChatAcceptButton> createState() => _ChatAcceptButtonState();
}

class _ChatAcceptButtonState extends State<ChatAcceptButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatAcceptButtonViewModel>(builder: (context, viewModel, child) {
      return TextButton(
        onPressed: () async {
          if (!viewModel.isLoading) {
            try {
              await viewModel.acceptChat(widget.chat);
            } catch (e) {
              showUnsuccessToast("Не удалось подтвердить");
            }
          }
        },
        child: viewModel.isLoading
            ? SizedBox(
          width: 10,
          height: 10,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ) : const Icon(Icons.done));
    });
  }
}
