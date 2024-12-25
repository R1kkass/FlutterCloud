import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/cubit/current_page_bloc.dart';
import 'package:TalkSpace/components/default_scaffold.dart';
import 'package:TalkSpace/features/chat/chat_accept.dart';
import 'package:TalkSpace/features/chat/chat_list_general.dart';
import 'package:TalkSpace/grpc/chat_grpc.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:TalkSpace/proto/chat/chat.pbgrpc.dart';
import 'package:TalkSpace/widget/chat/chat_list_messages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  List<ChatUser>? chats = [];
  TabController? controller;
  String? title;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, initialIndex: 0, vsync: this);
    controller?.addListener(() {
      title = titleTab[controller?.index];
    });
    context.read<CurrentPageBloc>().add(const ChangePage(1));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      floatButton: FloatingActionButton.small(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRouter.SEARCH_USERS, (r) => false);
          },
          child: const Icon(Icons.mode_edit)),
      showBottomNavigation: true,
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
          const ChatListMessages(),
          ChatListGeneral(
              callback: ChatGrpc().getUnSuccessChats,
              chatUnit: _paintChatAccept,
              generateKey: false)
        ],
      ),
    );
  }

  setChats(List<ChatUser> chatsUser) {
    chats = chatsUser;
    setState(() {});
  }

  Widget _paintChatAccept({required ChatUser chat}) {
    return ChatAccept(
      chat: chat,
      setChats: setChats,
    );
  }
}
