import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/chat_unit_list.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:hive/hive.dart';
import 'package:fixnum/fixnum.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ChatLists extends StatefulWidget {
  const ChatLists({super.key, required this.title});

  final String title;

  @override
  State<ChatLists> createState() => _ChatListsState();
}

class _ChatListsState extends State<ChatLists> {
  List<ChatUsers>? chats = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              _checkPubKey(chats);
              return ListView.builder(
                  itemCount: chats?.length,
                  itemBuilder: (context, index) {
                    return ChatUnitList(
                      chat: chats![index],
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

Future _checkPubKey(List<ChatUsers>? chats) async {
  var secretBox = await Hive.openBox("secretkey");
  var box = await Hive.openBox("pubkey");

  chats?.forEach((chat) async {
    if (box.get(chat.chatId.toString() + jwtDecode().email) == null) {
      GetPublicKeyResponse keys =
          await getPublicKey(GetPublicKeyRequest(chatId: chat.chat.id));
      var key = await generatePubKey(keys.p, keys.g.toInt(), chat.chat.id);
      await createSecondaryKey(
          CreateSecondaryKeyRequest(chatId: chat.chat.id, key: key.toString()));
    }
    secretBox.delete(chat.chatId.toString() + jwtDecode().email);
    if (secretBox.get(chat.chatId.toString() + jwtDecode().email) == null) {
      getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.chat.id))
          .then((keys) async {
        await generateSecretKey(keys.key, keys.p, chat.chat.id);
      });
    }
  });
}
