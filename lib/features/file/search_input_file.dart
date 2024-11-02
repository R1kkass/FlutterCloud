import 'package:flutter/material.dart';

//ignore: must_be_immutable
class SearchInputFile extends StatefulWidget {
  SearchInputFile({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.error,
    this.fieldSubmit,
    this.elevation,
    this.suffixIcon,
    this.autoFocus = false,
    obscureText,
  }) : obscureText = obscureText ?? false;

  final TextEditingController? controller;
  final String title;
  final IconData icon;
  final bool autoFocus;
  bool? elevation;
  IconButton? suffixIcon;
  final String error;
  bool obscureText;
  void Function(String)? fieldSubmit;

  @override
  State<SearchInputFile> createState() => _SearchInputFileState();
}

class _SearchInputFileState extends State<SearchInputFile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.elevation != null ? 0 : 5.0,
      child: TextFormField(
        autofocus: widget.autoFocus,
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
