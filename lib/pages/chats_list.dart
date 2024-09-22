import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/chat_unit_list.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
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

class _ChatListsState extends State<ChatLists> {
  List<ChatUsers>? chats = [];

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder<GetResponseChat>(
          future: getChat(Empty()),
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
                            child: Icon(Icons.error,
                                color: Colors.red, size: 70)))),
              );
            } else {
              chats = snapshot.data?.chats;
              _checkPubKey(chats);
              return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
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
    secretBox.delete(key);
    if (secretBox.get(key) == null) {
      getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.chat.id))
          .then((keys) async {
        await generateSecretKey(keys.key, keys.p, chat.chat.id);
      });
    }
  });
}
