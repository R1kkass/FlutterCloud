import 'package:flutter/material.dart';

class NotFoundChatsForSubmit extends StatelessWidget {
  const NotFoundChatsForSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - 70 - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: Icon(Icons.search_rounded, size: 80)),
              Text(
                "Нет чатов на подтверждение",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.shade400,
                    fontSize: 28
                ),
              ),
            ],
          )
        )
      )
    );
  }
}