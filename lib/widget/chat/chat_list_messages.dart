import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/chat/chat_unit_list.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/grpc/keys_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/keys/keys.pb.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:flutter_application_2/services/hive_boxes.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class ChatListMessages extends StatefulWidget {
  const ChatListMessages({super.key});

  @override
  State<ChatListMessages> createState() => _ChatListMessagesGeneralState();
}

class _ChatListMessagesGeneralState extends State<ChatListMessages> {
  ResponseStream<StreamGetResponseChat>? stream;
  List<ChatUsersCount> chats = [];
  @override
  void initState() {
    super.initState();
    stream = ChatGrpc().streamGetChat();
    stream?.listen((data) {
      chats = data.chats;
      setState(() {});
      _checkPubKey(chats);
    });
  }

  @override
  void dispose() {
    super.dispose();
    stream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
      for (var item in chats)
        ChatUnitList(
          chat: item,
        )
    ]);
  }

  Future _checkPubKey(List<ChatUsersCount>? chats) async {
    var secretBox = HiveBoxes().secretKey;
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
