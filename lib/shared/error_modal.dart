import 'package:flutter/material.dart';

class ErrorModal extends StatelessWidget {

  ErrorModal({super.key, this.callback});

  void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const Icon(Icons.error, color: Colors.red, size: 70),
        callback != null ? TextButton(
          onPressed: () {},
          child: Text("Повторить")) : SizedBox(),
      ],)
    );
  }
}
