import 'package:TalkSpace/main.dart';
import 'package:flutter/material.dart';

void showToast(String text) {
  final scaffold =
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.blueAccent,
      action: SnackBarAction(
        label: 'Oк',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
      duration: Duration(seconds: 1),
    ),
  );
}

void showUnsuccessToast(String text) {
  final scaffold =
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!);
  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red.shade800,
      content: Text(text),
      action: SnackBarAction(
        label: 'Oк',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
      duration: Duration(seconds: 1),
    ),
  );
}

void showSuccessToast(String text) {
  final scaffold =
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.green.shade600,
      action: SnackBarAction(
        label: 'Oк',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
      duration: Duration(seconds: 1),
    ),
  );
}
