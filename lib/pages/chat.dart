import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/animated_chat_list.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/entities/chat/chat_float_button.dart';
import 'package:flutter_application_2/entities/chat/chat_input.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:grpc/grpc.dart';
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

  late final ScrollController _scrollController;
  var page = 0;
  var pageBottom = 0;
  var count = 0;
  ResponseStream<StreamGetMessagesResponse>? connect;

  List<Message> data = [];
  bool init = false;
  String key = "";

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getBox();

      var response = await ChatGrpc().getMessages(
          GetMessagesRequest(chatId: widget.args.chatId, page: 0, init: true));
      page = response.page;
      pageBottom = response.page;
      count = response.countNotRead;

      data = [...data, ...response.messages];
      _key.currentState?.insertAllItems(0, data.length,
          duration: const Duration(milliseconds: 0));
      if (response.countNotRead != 0) {
        showFloatButton == true;
      }
      setState(() {});
      await _grpc();
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller?.close();
      await connect?.cancel();
    });
  }

  StreamController<StreamGetMessagesRequest>? controller;

  _grpc() async {
    controller = StreamController<StreamGetMessagesRequest>();
    Stream<StreamGetMessagesRequest> onExit = controller!.stream;

    connect = await ChatGrpc()
        .streamGetMessages(onExit, widget.args.chatId.toString());

    connect?.listen((onData) {
      setState(() {
        if (onData.type == TypeMessage.SEND_MESSAGE) {
          var message = onData.message;

          data = [
            message,
            ...data,
          ];

          _key.currentState
              ?.insertItem(0, duration: const Duration(milliseconds: 0));
        }
        if (onData.type == TypeMessage.READ_MESSAGE) {
          var index = data.indexWhere((item) {
            return item.id == onData.message.id;
          });
          _key.currentState?.setState(() {
            data[index] = onData.message;
          });
        }
      });
    });
  }

  var scrolling = false;

  _scrollDown() {
    scrolling = true;
    _scrollController
        .animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    )
        .then((e) {
      scrolling = false;
    });
    setState(() {
      showFloatButton = false;
    });
  }

  _addMessage() {
    var hashText = EncryptMessage().encrypt(text.text, key);
    controller?.add(StreamGetMessagesRequest(
        message: hashText.base64, type: TypeMessage.SEND_MESSAGE));
    text.text = "";
  }

  _getBox() async {
    var box = await Hive.openBox('secretkey');
    key = box.get(widget.args.chatId.toString() + jwtDecode().email);
    setState(() {});
  }

  _readMessage(int messageId) {
    controller?.add(StreamGetMessagesRequest(
        messageId: messageId, type: TypeMessage.READ_MESSAGE));
    setState(() {
      count--;
    });
  }

  var showFloatButton = false;
  double currPosition = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      floatButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: ChatFloatButton(
          action: _scrollDown,
          count: count,
          showFloatButton: showFloatButton,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: NotificationListener(
                  onNotification: (t) {
                    if (t is ScrollStartNotification && scrolling == false) {
                      currPosition = t.metrics.pixels;
                    }
                    if (t is ScrollUpdateNotification && scrolling == false) {
                      if (currPosition > t.metrics.pixels &&
                          showFloatButton == false) {
                        setState(() {
                          showFloatButton = true;
                        });
                      } else if (currPosition < t.metrics.pixels &&
                          showFloatButton == true) {
                        setState(() {
                          showFloatButton = false;
                        });
                      }
                    }

                    if (t is ScrollEndNotification &&
                        t.metrics.pixels ==
                            _scrollController.position.maxScrollExtent) {
                      page++;
                      ChatGrpc()
                          .getMessages(GetMessagesRequest(
                              chatId: widget.args.chatId, page: page))
                          .then((response) {
                        data = [...data, ...response.messages];
                        setState(() {});
                        _key.currentState
                            ?.insertAllItems(0, response.messages.length);
                      });
                    }
                    if (t is ScrollEndNotification && t.metrics.pixels == 0.0) {
                      setState(() {
                        showFloatButton = false;
                      });
                      if (pageBottom > 0) {
                        pageBottom--;

                        ChatGrpc()
                            .getMessages(GetMessagesRequest(
                                chatId: widget.args.chatId, page: pageBottom))
                            .then((response) {
                          data = [...response.messages, ...data];
                          setState(() {});
                          _key.currentState
                              ?.insertAllItems(0, response.messages.length);
                        });
                      }
                    }
                    return true;
                  },
                  child: AnimatedChatList(
                    readCallback: _readMessage,
                    controller: _scrollController,
                    data: data,
                    keyChat: key,
                    globalKey: _key,
                  ),
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
