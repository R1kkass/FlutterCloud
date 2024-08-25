import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/chat_unit_list.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/pages/chat.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';

class ChatLists extends StatefulWidget {
  const ChatLists({super.key, required this.title});

  final String title;

  @override
  State<ChatLists> createState() => _ChatListsState();
}

class _ChatListsState extends State<ChatLists> {
  List<ChatUsers>? chats = [];

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        title: widget.title,
        body: Container(
            child: FutureBuilder<GetResponseChat>(
          future: getChat(Empty()),
          builder:
              (BuildContext context, AsyncSnapshot<GetResponseChat> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              chats = snapshot.data?.chats;
              return ListView.builder(
                  itemCount: chats?.length,
                  itemBuilder: (context, index) {
                    return ChatUnitList(
                      chat: chats![index],
                    );
                  });
            }
          },
        )));
  }
}
