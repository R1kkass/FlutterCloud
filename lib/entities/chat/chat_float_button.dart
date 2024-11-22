import 'package:flutter/material.dart';

class ChatFloatButton extends StatefulWidget {
  final int count;
  final bool showFloatButton;
  final void Function() action;

  const ChatFloatButton(
      {super.key,
      required this.action,
      required this.count,
      required this.showFloatButton});

  @override
  State<ChatFloatButton> createState() => _ChatFloatButtonState();
}

class _ChatFloatButtonState extends State<ChatFloatButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: widget.showFloatButton
            ? FloatingActionButton.small(
                shape: const CircleBorder(),
                onPressed: widget.action,
                child: widget.count > 0
                    ? Badge(
                        backgroundColor: Colors.blueAccent,
                        label: Text('${widget.count}'),
                        child: const Icon(Icons.expand_more, size: 30),
                      )
                    : const Icon(Icons.expand_more, size: 30))
            : const SizedBox());
  }
}
