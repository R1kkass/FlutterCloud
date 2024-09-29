import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/grpc/keys_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/keys/keys.pb.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChatListGeneral extends StatefulWidget {
  final Future<GetResponseChat> Function(GetRequestChat) callback;
  final Function chatUnit;
  final GetRequestChat args;
  final bool generateKey;
  const ChatListGeneral(
      {super.key,
      required this.callback,
      required this.chatUnit,
      required this.args,
      required this.generateKey});

  @override
  State<ChatListGeneral> createState() => _ChatListGeneralState();
}

class _ChatListGeneralState extends State<ChatListGeneral> {
  List<ChatUsers>? chats = [];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder<GetResponseChat>(
        future: widget.callback(widget.args),
        builder:
            (BuildContext context, AsyncSnapshot<GetResponseChat> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                      height: MediaQuery.sizeOf(context).height - 70 - 100,
                      child: const Center(
                          child:
                              Icon(Icons.error, color: Colors.red, size: 70)))),
            );
          } else if (snapshot.data?.chats != null &&
              (snapshot.data?.chats as List).isEmpty) {
            return Center(
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                      height: MediaQuery.sizeOf(context).height - 70 - 100,
                      child: const Center(
                          child: Icon(Icons.search_rounded, size: 70)))),
            );
          } else {
            _checkPubKey(chats);
            chats = snapshot.data?.chats;
            return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: chats?.length,
                itemBuilder: (context, index) {
                  return widget.chatUnit(
                    chat: chats![index],
                  );
                });
          }
        },
      ),
    );
  }
}

Future _checkPubKey(List<ChatUsers>? chats) async {
  var secretBox = await Hive.openBox("secretkey");
  var box = await Hive.openBox("pubkey");
  var email = jwtDecode().email;
  var keyChanged = false;

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
      keyChanged = true;

      getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.chat.id))
          .then((keys) async {
        await generateSecretKey(keys.key, keys.p, chat.chat.id);
      });
    }
  });

  if (true) {
    var values = secretBox.values.toList();
    var keys = secretBox.keys.toList();
    var resultObj = {};

    for (var i = 0; i < keys.length; i++) {
      resultObj[keys[i]] = values[i];
    }

    await KeysGrpc().uploadFile(FileUploadRequest(
        chunk: utf8.encode(jsonEncode(resultObj).toString())));
  }
}