import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_list/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/presentation/widgets/scaffold/default_scaffold.dart';
import 'package:TalkSpace/presentation/widgets/messenger/chat/chat_submit/chat_list_general.dart';

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
      floatButton: FloatingActionButton.small(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.SEND_TO_CREATE_CHAT,);
        },
        child: const Icon(Icons.mode_edit)
      ),
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
          const ChatListGeneral()
        ],
      ),
    );
  }
}
