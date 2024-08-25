import 'package:flutter/material.dart';

//ignore: must_be_immutable
class MyInput extends StatefulWidget {
  MyInput({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.error,
    this.fieldSubmit,
    this.suffixIcon,
    obscureText,
  }) : obscureText = obscureText ?? false;

  final TextEditingController? controller;
  final String title;
  final IconData icon;
  IconButton? suffixIcon;
  final String error;
  bool obscureText;
  void Function(String)? fieldSubmit;

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: TextFormField(
        onFieldSubmitted: widget.fieldSubmit,
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              color: Colors.deepOrange,
            ),
            suffixIcon: widget.suffixIcon,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
