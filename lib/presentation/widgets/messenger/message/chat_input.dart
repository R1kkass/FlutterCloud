import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ChatInput extends StatefulWidget {
  ChatInput({
    super.key,
    required this.controller,
    required this.title,
    required this.error,
    this.fieldSubmit,
    this.suffixIcon,
    obscureText,
  }) : obscureText = obscureText ?? false;

  final TextEditingController? controller;
  final String title;
  Widget? suffixIcon;
  final String error;
  bool obscureText;
  void Function(String)? fieldSubmit;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: TextFormField(
        onFieldSubmitted: widget.fieldSubmit,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            filled: true,
            contentPadding: const EdgeInsets.all(20.0),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(500.0)),
                borderSide: BorderSide(color: Colors.white, width: 3.0)),
            hintText: widget.title),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return widget.error;
          }
          return null;
        },
      ),
    );
  }
}
