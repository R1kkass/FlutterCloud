import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:TalkSpace/features/chat/chat_unit_list.dart';
import 'package:TalkSpace/grpc/chat_grpc.dart';
import 'package:TalkSpace/grpc/keys_grpc.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:TalkSpace/proto/keys/keys.pb.dart';
import 'package:TalkSpace/services/dh_alhoritm.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:TalkSpace/shared/toast.dart';
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
  var secretBox = HiveBoxes().secretKey;
  var pubKeyBox = Hive.box("pubkey");
  var tokenBox = Hive.box("token");

  var email = jwtDecode().email;
  var keyChanged = false;
  var keyGeted = false;
  var chatGrpc = ChatGrpc();

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
    try {
      for (var chat in chats as List<ChatUsersCount>) {
        await _readDownloadKeys(chat);
        await _createSecondaryKey(chat);
        await _createSecretKey(chat);
      }
      await _sendNewKeys();
    } catch (e) {
      showToast(context, "Неизвестная ошибка");
    }
  }

  Future _readDownloadKeys(ChatUsersCount chat) async {
    try {
      var key = chat.chatId.toString() + email;

      if (secretBox.get(key) == null && !keyGeted) {
        var y = await KeysGrpc().downloadKeys;
        Map<String, dynamic> data = jsonDecode(y);
        for (var item in data.keys) {
          await secretBox.put(item, data[item]);
        }
        keyGeted = true;
      }
    } catch (e) {}
  }

  Future _createSecondaryKey(ChatUsersCount chat) async {
    try {
      var key = chat.chatId.toString() + email;
      if (pubKeyBox.get(key) == null && secretBox.get(key) == null) {
        GetPublicKeyResponse keys = await chatGrpc
            .getPublicKey(GetPublicKeyRequest(chatId: chat.chat.id));
        var key = await generatePubKey(keys.p, keys.g.toInt(), chat.chat.id);
        await chatGrpc.createSecondaryKey(CreateSecondaryKeyRequest(
            chatId: chat.chat.id, key: key.toString()));
      }
    } catch (e) {}
  }

  Future _createSecretKey(ChatUsersCount chat) async {
    try {
      var key = chat.chatId.toString() + email;

      if (secretBox.get(key) == null) {
        keyChanged = true;

        await chatGrpc
            .getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.chat.id))
            .then((keys) async {
          await generateSecretKey(keys.key, keys.p, chat.chat.id);
        });
      }
    } catch (e) {}
  }

  Future _sendNewKeys() async {
    try {
      if (keyChanged || true) {
        var pass = tokenBox.get("password");
        var values = secretBox.values.toList();
        var keys = secretBox.keys.toList();
        var resultObj = {};

        for (var i = 0; i < keys.length; i++) {
          resultObj[keys[i]] =
              utf8.decode(crypt(true, utf8.encode(values[i]), pass));
        }
        List<int> json = utf8.encode(jsonEncode(resultObj).toString());

        await KeysGrpc().uploadFile(KeysUploadRequest(chunk: json));
      }
    } catch (e) {}
  }
}
