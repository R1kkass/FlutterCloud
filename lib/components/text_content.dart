import 'package:flutter/material.dart';

class TextContent extends StatefulWidget {
  final String text;
  const TextContent({super.key, required this.text});

  @override
  State<TextContent> createState() => _TextContentState();
}

class _TextContentState extends State<TextContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 140,
      child: Text(widget.text,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20)),
    );
  }
}
