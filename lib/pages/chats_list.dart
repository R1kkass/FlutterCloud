import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/current_page_bloc.dart';
import 'package:flutter_application_2/features/chat/chat_unit_list.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/entities/chat/chat_accept.dart';
import 'package:flutter_application_2/features/chat/chat_list_general.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/grpc/keys_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';
import 'package:flutter_application_2/proto/keys/keys.pb.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    context.read<CurrentPageBloc>().add(const ChangePage(1));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
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
          ChatListGeneral(
              callback: _chatList,
              chatUnit: _paintChat,
              generateKey: true),
          ChatListGeneral(
              callback: ChatGrpc().getUnSuccessChats,
              chatUnit: _paintChatAccept,
              generateKey: false)
        ],
      ),
    );
  }

  Widget _paintChat({required ChatUsersCount chat}) {
    return ChatUnitList(chat: chat);
  }

  Widget _paintChatAccept({required ChatUsers chat}) {
    return ChatAccept(chat: chat);
  }

  Future<GetResponseChat> _chatList() async {
    var chats = await ChatGrpc().getChat();
    await _checkPubKey(chats.chats);
    return chats;
  }

  Future _checkPubKey(List<ChatUsersCount>? chats) async {
    var secretBox = await Hive.openBox("secretkey");
    var box = await Hive.openBox("pubkey");
    var token = await Hive.openBox("token");
    var email = jwtDecode().email;
    var keyChanged = false;
    var keyGeted = false;
    var chatGrpc = ChatGrpc();
    try {
      for (var chat in chats as List<ChatUsersCount>) {
        var key = chat.chatId.toString() + email;

        if (secretBox.get(key) == null && !keyGeted) {
          try {
            var y = await KeysGrpc().downloadKeys;
            Map<String, dynamic> data = jsonDecode(y);
            for (var item in data.keys) {
              await secretBox.put(item, data[item]);
            }
            keyGeted = true;
          } catch (e) {}
        }

        if (box.get(key) == null && secretBox.get(key) == null) {
          try {
            GetPublicKeyResponse keys = await chatGrpc
                .getPublicKey(GetPublicKeyRequest(chatId: chat.chat.id));
            var key =
                await generatePubKey(keys.p, keys.g.toInt(), chat.chat.id);
            await chatGrpc.createSecondaryKey(CreateSecondaryKeyRequest(
                chatId: chat.chat.id, key: key.toString()));
          } catch (e) {}
        }
        if (secretBox.get(key) == null) {
          try {
            keyChanged = true;

            await chatGrpc
                .getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.chat.id))
                .then((keys) async {
              await generateSecretKey(keys.key, keys.p, chat.chat.id);
            });
          } catch (e) {}
        }
      }
      if (keyChanged) {
        try {
          var pass = token.get("password");
          var values = secretBox.values.toList();
          var keys = secretBox.keys.toList();
          var resultObj = {};

          for (var i = 0; i < keys.length; i++) {
            resultObj[keys[i]] = values[i];
          }
          dynamic json = jsonEncode(resultObj).toString();
          json = crypt(true, utf8.encode(json), pass);

          await KeysGrpc().uploadFile(KeysUploadRequest(chunk: json));
        } catch (e) {}
      }
    } catch (e) {
      showToast(context, "Неизвестная ошибка");
    }
  }
}
