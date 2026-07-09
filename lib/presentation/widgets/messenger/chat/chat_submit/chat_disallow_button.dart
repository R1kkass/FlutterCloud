import 'package:TalkSpace/presentation/viewmodels/messenger/chat/chat_submit/chat_disallow_button_view_model.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_submit/chat_accept.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatDisallowButton extends ChatAcceptImpl {
  const ChatDisallowButton(
      {super.key, required super.chat});

  @override
  State<ChatDisallowButton> createState() => _ChatDisallowButtonState();
}

class _ChatDisallowButtonState extends State<ChatDisallowButton> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatDisallowButtonViewModel>(builder: (context, viewModel, child) {
      return TextButton(
          onPressed: () async {
            if (!viewModel.isLoading) {
              await viewModel.disallow(widget.chat);
            }
          },
          child: viewModel.isLoading
              ? SizedBox(
            width: 10,
            height: 10,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
              : const Icon(Icons.clear));
    });
  }
}
