import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/grpc/keys_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/keys/keys.pb.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:hive/hive.dart';

class ChatAccept extends StatefulWidget {
  final ChatUsers chat;

  const ChatAccept({super.key, required this.chat});

  @override
  State<ChatAccept> createState() => _ChatAcceptState();
}

class _ChatAcceptState extends State<ChatAccept> {
  JwtPayload? jwt;

  @override
  void initState() {
    super.initState();
    jwt = jwtDecode();
  }

  @override
  Widget build(BuildContext context) {
    var chat = widget.chat;
    return Material(
      elevation: 5.0,
      child: TextButton(
        style: ButtonStyle(
            textStyle:
                WidgetStateProperty.all(const TextStyle(color: Colors.black)),
            shape: WidgetStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ))),
        onPressed: () {},
        child: Row(
          children: [
            Text(
              chat.chat.nameChat == ""
                  ? jwt?.email != chat.chat.chatUsers[0].user.email
                      ? chat.chat.chatUsers[0].user.name
                      : chat.chat.chatUsers[1].user.name
                  : chat.chat.nameChat,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            TextButton(
                onPressed: () async {
                  await _accept(chat);
                },
                child: const Icon(Icons.done)),
            TextButton(
                onPressed: () async {
                  await _dissalow(chat);
                },
                child: const Icon(Icons.clear))
          ],
        ),
      ),
    );
  }
}

Future _accept(ChatUsers chat) async {
  var secretBox = await Hive.openBox("secretkey");
  var box = await Hive.openBox("pubkey");
  var email = jwtDecode().email;

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
  var values = secretBox.values.toList();
  var keys = secretBox.keys.toList();
  var resultObj = {};

  for (var i = 0; i < keys.length; i++) {
    resultObj[keys[i]] = values[i];
  }
  var pass = (await Hive.openBox("token")).get("password");
  dynamic json = jsonEncode(resultObj).toString();
  json = crypt(true, utf8.encode(json), pass);

  await KeysGrpc().uploadFile(FileUploadRequest(chunk: json));
  await ChatGrpc().acceptChat(AcceptChatRequest(chatId: chat.id));
}

Future _dissalow(ChatUsers chat) async {
  await ChatGrpc().dissalowChat(DissalowChatRequest(chatId: chat.id));
}
