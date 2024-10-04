import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/chat/chat_unit_list.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/entities/chat/chat_accept.dart';
import 'package:flutter_application_2/features/chat/chat_list_general.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';

class ChatLists extends StatefulWidget {
  const ChatLists({super.key, required this.title});

  final String title;

  @override
  State<ChatLists> createState() => _ChatListsState();
}

Map<int, String> titleTab = {
  0: "Чаты",
  1: "Подтверждение",
};

class _ChatListsState extends State<ChatLists>
    with SingleTickerProviderStateMixin {
  List<ChatUsers>? chats = [];
  TabController? controller;
  String? title;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, initialIndex: 0, vsync: this);
    controller?.addListener(() {
      title = titleTab[controller?.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: title ?? widget.title,
      bottom: PreferredSize(
        preferredSize: const Size(0, 0),
        child: TabBar(
          controller: controller,
          labelColor: Colors.white,
          dividerColor: Colors.transparent,
          tabs: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Tab(
                height: 2,
                text: "",
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Tab(
                height: 2,
                text: "",
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          ChatListGeneral(
              callback: ChatGrpc().getChat,
              chatUnit: _paintChat,
              args: GetRequestChat(submitCreate: true),
              generateKey: true),
          ChatListGeneral(
              callback: ChatGrpc().getChat,
              chatUnit: _paintChatAccept,
              args: GetRequestChat(submitCreate: false),
              generateKey: false)
        ],
      ),
    );
  }

  Widget _paintChat({required ChatUsers chat}) {
    return ChatUnitList(chat: chat);
  }

  Widget _paintChatAccept({required ChatUsers chat}) {
    return ChatAccept(chat: chat);
  }
}
