import 'package:flutter/material.dart';

class ChatListGeneral extends StatefulWidget {
  final Future<dynamic> Function() callback;
  final Function chatUnit;
  final bool generateKey;
  const ChatListGeneral(
      {super.key,
      required this.callback,
      required this.chatUnit,
      required this.generateKey});

  @override
  State<ChatListGeneral> createState() => _ChatListGeneralState();
}

class _ChatListGeneralState extends State<ChatListGeneral> {
  List<dynamic> chats = [];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder<dynamic>(
        future: widget.callback(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                      height: MediaQuery.sizeOf(context).height - 70 - 100,
                      child: const Center(
                          child:
                              Icon(Icons.error, color: Colors.red, size: 70)))),
            );
          } else if (snapshot.data?.chats != null &&
              (snapshot.data?.chats as List).isEmpty) {
            return Center(
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                      height: MediaQuery.sizeOf(context).height - 70 - 100,
                      child: const Center(
                          child: Icon(Icons.search_rounded, size: 70)))),
            );
          } else {
            chats = snapshot.data?.chats;
            return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return widget.chatUnit(
                    chat: chats[index],
                  );
                });
          }
        },
      ),
    );
  }
}
