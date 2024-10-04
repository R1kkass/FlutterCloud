import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/entities/chat/animated_chat_list.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/entities/chat/chat_input.dart';
import 'package:flutter_application_2/consts/domen.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:hive/hive.dart';

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
  String key = "";

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _socket();
      _getBox();
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
    var hashText = encrypt(text.text, key);
    socket?.add(hashText.base64);
    text.text = "";
  }

  _getBox() async {
    var box = await Hive.openBox('secretkey');
    key = box.get(widget.args.chatId.toString() + jwtDecode().email);
    setState(() {});
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
                child: AnimatedChatList(
                  data: data,
                  keyChat: key,
                  globalKey: _key,
                )),
            ChatInput(
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
