import 'package:flutter/material.dart';

class ErrorChatLoadForSubmit extends StatelessWidget {
  const ErrorChatLoadForSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - 70 - 100,
          child: const Center(
            child:
            Icon(Icons.error, color: Colors.red, size: 70)
          )
        )
      ),
    );
  }
}