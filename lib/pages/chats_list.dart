import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/chat_unit_list.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/entities/chat/chat_accept.dart';
import 'package:flutter_application_2/features/chat/chat_list_general.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:hive/hive.dart';

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
      // setState(() {
      title = titleTab[controller?.index];
      // });
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
              callback: getChat,
              chatUnit: paintChat,
              args: GetRequestChat(submitCreate: true)),
          ChatListGeneral(
              callback: getChat,
              chatUnit: paintChatAccept,
              args: GetRequestChat(submitCreate: false))
        ],
      ),
    );
  }
}

Widget paintChat({required ChatUsers chat}) {
  return ChatUnitList(chat: chat);
}

Widget paintChatAccept({required ChatUsers chat}) {
  return ChatAccept(chat: chat);
}

Future _checkPubKey(List<ChatUsers>? chats) async {
  var secretBox = await Hive.openBox("secretkey");
  var box = await Hive.openBox("pubkey");
  var email = jwtDecode().email;

  chats?.forEach((chat) async {
    var key = chat.chatId.toString() + email;
    if (box.get(key) == null) {
      GetPublicKeyResponse keys =
          await getPublicKey(GetPublicKeyRequest(chatId: chat.chat.id));
      var key = await generatePubKey(keys.p, keys.g.toInt(), chat.chat.id);
      await createSecondaryKey(
          CreateSecondaryKeyRequest(chatId: chat.chat.id, key: key.toString()));
    }
    if (secretBox.get(key) == null) {
      getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.chat.id))
          .then((keys) async {
        await generateSecretKey(keys.key, keys.p, chat.chat.id);
      });
    }
  });
}
