import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_float_button_scroll_bottom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatFloatButton extends StatelessWidget {

  const ChatFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatFloatButtonScrollBottomViewModel>(builder: (context, viewModel, child) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: viewModel.showButton
          ? FloatingActionButton.small(
          shape: const CircleBorder(),
          onPressed: viewModel.scrollDown,
          child: viewModel.chatViewModel.countNotReadingMessages > 0
              ? Badge(
            backgroundColor: Colors.blueAccent,
            label: Text('${viewModel.chatViewModel.countNotReadingMessages}'),
            child: const Icon(Icons.expand_more, size: 30),
          )
              : const Icon(Icons.expand_more, size: 30))
          : const SizedBox()
      );
    });
  }
}
