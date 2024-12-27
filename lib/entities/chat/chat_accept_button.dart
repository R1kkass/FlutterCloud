import 'dart:convert';

import 'package:TalkSpace/features/chat/chat_accept.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/grpc/chat_grpc.dart';
import 'package:TalkSpace/grpc/keys_grpc.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:TalkSpace/proto/keys/keys.pb.dart';
import 'package:TalkSpace/services/dh_alhoritm.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:hive/hive.dart';

class ChatAcceptButton extends ChatAcceptImpl {
  const ChatAcceptButton(
      {super.key, required super.chat, required super.setChats});

  @override
  State<ChatAcceptButton> createState() => _ChatAcceptButtonState();
}

class _ChatAcceptButtonState extends State<ChatAcceptButton> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (!isLoading) {
            await _accept();
          }
        },
        child: isLoading
            ? SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : const Icon(Icons.done));
  }

  Future _accept() async {
    try {
      await _acceptChat();
    } catch (e) {
      showToast(context, "Не удалось подтвердить");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future _acceptChat() async {
    setState(() {
      isLoading = true;
    });
    var chat = widget.chat;
    var secretBox = HiveBoxes.secretKey;
    await _createSecretChatKey(chat, secretBox);
    await _uploadNewChatKeys(chat, secretBox);
  }

  Future _createSecretChatKey(ChatUser chat, Box<String> secretBox) async {
    var email = jwtDecode().email;
    var box = Hive.box("pubkey");

    var key = chat.chatId.toString() + email;
    if (box.get(key) == null) {
      GetPublicKeyResponse keys = await ChatGrpc()
          .getPublicKey(GetPublicKeyRequest(chatId: chat.chat.id));
      var key = await generatePubKey(keys.p, keys.g.toInt(), chat.chat.id);
      await ChatGrpc().createSecondaryKey(
          CreateSecondaryKeyRequest(chatId: chat.chat.id, key: key.toString()));
    }
    if (secretBox.get(key) == null) {
      ChatGrpc()
          .getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.chat.id))
          .then((keys) async {
        await generateSecretKey(keys.key, keys.p, chat.chat.id);
      });
    }
  }

  Future _uploadNewChatKeys(ChatUser chat, Box<String> secretBox) async {
    var values = secretBox.values.toList();
    var keys = secretBox.keys.toList();
    var resultObj = {};

    var pass = Hive.box("token").get("password");

    for (var i = 0; i < keys.length; i++) {
      resultObj[keys[i]] = encrypt(values[i], pass);
    }
    List<int> json = utf8.encode(jsonEncode(resultObj).toString());
    await KeysGrpc().uploadFile(KeysUploadRequest(chunk: json));

    widget.setChats(
        (await ChatGrpc().acceptChat(AcceptChatRequest(chatId: chat.chat.id)))
            .chats);
  }
}
