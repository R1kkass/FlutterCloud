import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/components/message.dart';
import 'package:flutter_application_2/components/my_input.dart';
import 'package:flutter_application_2/consts/domen.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ChatArgument {
  final int chatId;
  const ChatArgument({required this.chatId});
}

class ChatPage extends StatefulWidget {
  final String title;
  final ChatArgument args;
  const ChatPage({super.key, required this.title, required this.args});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController text = TextEditingController();

  WebSocket? socket;
  List<dynamic> data = [];
  bool init = false;
  Map<String, dynamic> jwtDecode = {};

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    var token = Hive.box('token').get('access_token');

    jwtDecode = Jwt.parseJwt(token);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _socket();
      _getKey();
    });
  }

  _socket() async {
    String token = Hive.box('token').get('access_token');

    WebSocket.connect('ws://$ipServer:8000/ws?id=${widget.args.chatId}',
        headers: {"Access-Token": "Bearer $token"}).then((value) {
      socket = value;

      socket?.listen((onData) {
        setState(() {
          if (!init) {
            data = json.decode(onData);
            data = List.from(data.reversed);
            init = true;
            _key.currentState?.insertAllItems(0, data.length);
          } else {
            data = [
              json.decode(onData),
              ...data,
            ];
            _key.currentState
                ?.insertItem(0, duration: const Duration(milliseconds: 300));
          }
        });
      });
    });
  }

  _addMessage() {
    socket?.add(text.text);
  }

  _getKey() async {
    var box = await Hive.openBox("secretkey");
    box = await Hive.openBox('secretkey');
    // var pbox = await Hive.openBox("pubkey");
    log("${box.get(widget.args.chatId.toString() + jwtDecode["email"])}");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: AnimatedList(
                  key: _key,
                  initialItemCount: data.length,
                  reverse: true,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                        key: UniqueKey(),
                        sizeFactor: animation,
                        child: MessageComponent(
                          createdAt: data[index]["created_at"],
                          name: data[index]["user"]["name"],
                          status: jwtDecode["email"] ==
                              data[index]["user"]?["email"],
                          text: data[index]["text"],
                        ),
                      ),
                    );
                  }),
            ),
            MyInput(
              controller: text,
              title: "Сообщение",
              error: "Введите сообщение",
              icon: Icons.mail,
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                color: Colors.deepOrange.shade400,
                onPressed: _addMessage,
                iconSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
