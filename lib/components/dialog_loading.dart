import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white.withOpacity(0),
    content: Center(
      child: CircularProgressIndicator(),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
