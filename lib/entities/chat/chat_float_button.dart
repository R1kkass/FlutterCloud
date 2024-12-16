import 'package:flutter/material.dart';

class ChatFloatButton extends StatefulWidget {
  final int count;
  final void Function() action;

  const ChatFloatButton({
    super.key,
    required this.action,
    required this.count,
  });

  @override
  State<ChatFloatButton> createState() => ChatFloatButtonState();
}

class ChatFloatButtonState extends State<ChatFloatButton> {
  bool show = false;
  int count = 0;

  @override
  void initState() {
    super.initState();
    show = widget.count > 0;
    count = widget.count;
    setState(() {});
  }

  setShow(status) {
    show = status;
    setState(() {});
  }

  setCount(newCount) {
    setState(() {
      count = newCount;
    });
  }

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
        child: show
            ? FloatingActionButton.small(
                shape: const CircleBorder(),
                onPressed: widget.action,
                child: count > 0
                    ? Badge(
                        backgroundColor: Colors.blueAccent,
                        label: Text('${widget.count}'),
                        child: const Icon(Icons.expand_more, size: 30),
                      )
                    : const Icon(Icons.expand_more, size: 30))
            : const SizedBox());
  }
}
