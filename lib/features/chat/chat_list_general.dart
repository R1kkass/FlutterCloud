import 'package:flutter/material.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';

class ChatListGeneral extends StatefulWidget {
  final Future<GetResponseChat> Function(GetRequestChat) callback;
  final Function chatUnit;
  final GetRequestChat args;
  const ChatListGeneral(
      {super.key, required this.callback, required this.chatUnit, required this.args});

  @override
  State<ChatListGeneral> createState() => _ChatListGeneralState();
}

class _ChatListGeneralState extends State<ChatListGeneral> {
  List<ChatUsers>? chats = [];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder<GetResponseChat>(
        future: widget.callback(widget.args),
        builder:
            (BuildContext context, AsyncSnapshot<GetResponseChat> snapshot) {
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
                itemCount: chats?.length,
                itemBuilder: (context, index) {
                  return widget.chatUnit(
                    chat: chats![index],
                  );
                });
          }
        },
      ),
    );
  }
}
