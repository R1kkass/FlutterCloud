import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:TalkSpace/features/chat/chat_unit_list.dart';
import 'package:TalkSpace/data/repository/chat_grpc.dart';
import 'package:TalkSpace/data/repository/keys_grpc.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/dh_algoritm.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:TalkSpace/shared/toast.dart';

class ChatListMessages extends StatefulWidget {
  const ChatListMessages({super.key});

  @override
  State<ChatListMessages> createState() => _ChatListMessagesGeneralState();
}

class _ChatListMessagesGeneralState extends State<ChatListMessages> {
  StreamSubscription<StreamGetResponseChat>? stream;
  List<ChatWithUnReadingMessagesCount> chats = [];
  var secretBox = HiveBoxes.chatsSecretKey;
  var pubKeyBox = HiveBoxes.pubKey;
  var tokenBox = HiveBoxes.token;

  var email = jwtDecode().email;
  var keyChanged = false;
  var keyGeted = false;
  var chatGrpc = ChatGrpc();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      stream = await ChatGrpc().streamGetChat((data) async {
        chats = data.chats;
        setState(() {});
        await _checkPubKey(chats);
      });

      stream!.onError((e) {
        showUnsuccessToast("Ошибка соединения");
      });
    });

  }

  @override
  void dispose() async {
    super.dispose();
    await stream?.cancel();
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

  Future _checkPubKey(List<ChatWithUnReadingMessagesCount> chats) async {
    try {
      for (var chat in chats) {
        await _readDownloadKeys(chat);
        await _createSecondaryKey(chat);
        await _createSecretKey(chat);
      }
      await _sendNewKeys();
    } catch (e) {
      showUnsuccessToast("Неизвестная ошибка");
    }
  }

  Future _readDownloadKeys(ChatWithUnReadingMessagesCount chat) async {
    try {
      var key = chat.id.toString() + email;

      if (secretBox.get(key) == null && !keyGeted) {
        var userKeys = await KeysGrpc().downloadKeys;
        Map<String, dynamic> data = jsonDecode(userKeys);
        var pass = HiveBoxes.token.get("password")!;
        Map<String, String> decryptKeys = {};

        for (var item in data.keys) {
          decryptKeys[item] = decrypt(data[item], pass);
        }
        await secretBox.put(email, decryptKeys);
        keyGeted = true;
      }
    } catch (e) {}
  }

  Future _createSecondaryKey(ChatWithUnReadingMessagesCount chat) async {
    try {
      var key = chat.toString() + email;
      if (pubKeyBox.get(key) == null && secretBox.get(secretBox.get(email)![chat.id.toString()] == null) == null) {
        GetPublicKeyResponse keys = await chatGrpc
            .getPublicKey(GetPublicKeyRequest(chatId: chat.id));
        var key = await DHAlgorithm.generatePubKey(keys.p, keys.g.toInt(), chat.id);
        await chatGrpc.createSecondaryKey(CreateSecondaryKeyRequest(
            chatId: chat.id, key: key.toString()));
      }
    } catch (e) {}
  }

  Future _createSecretKey(ChatWithUnReadingMessagesCount chat) async {
    try {
      var chatId = chat.id.toString();
      
      if (secretBox.get(email) == null) {
        secretBox.put(email, {});
      }
      if (secretBox.get(email)![chatId] == null) {
        keyChanged = true;

        await chatGrpc
            .getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.id))
            .then((keys) async {
          await DHAlgorithm.generateSecretKey(keys.key, keys.p, chat.id);
        });
      }
    } catch (e) {}
  }

  Future _sendNewKeys() async {
    try {
      if (keyChanged) {
        await KeysGrpc().uploadNewKeys();
      }
    } catch (e) {}
  }
}
