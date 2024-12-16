import 'package:flutter/material.dart';

class TextButtonGallery extends StatefulWidget {
  const TextButtonGallery(
      {super.key,
      required this.color,
      required this.text,
      required this.icon,
      required this.child,
      required this.action,
      required this.secondaryText});

  final Color color;
  final Function() action;
  final String text;
  final Widget child;
  final String secondaryText;
  final IconData icon;

  @override
  State<TextButtonGallery> createState() => _TextButtonGalleryState();
}

class _TextButtonGalleryState extends State<TextButtonGallery> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
      onPressed: widget.action,
      child: Row(
        children: [
          SizedBox(
            width: 45,
            height: 45,
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    widget.icon,
                    size: 40,
                  ),
                ),
                widget.child
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                Text(widget.secondaryText,
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
