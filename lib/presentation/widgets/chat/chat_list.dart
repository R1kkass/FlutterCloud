import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {

  ChatList({
    super.key,
  });

  @override
  State createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  double currPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: NotificationListener(
                onNotification: (t) {
                  if (t is ScrollStartNotification && !scrolling) {
                    currPosition = t.metrics.pixels;
                  }
                  if (t is ScrollUpdateNotification && !scrolling) {
                    if (currPosition > t.metrics.pixels &&
                        !key.currentState!.show) {
                      key.currentState?.setShow(true);
                    } else if (currPosition < t.metrics.pixels &&
                        globalKey.currentState!.show) {
                      globalKey.currentState?.setShow(false);
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
                    if (globalKey.currentState!.show) {
                      globalKey.currentState?.setShow(false);
                    }
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
            suffixIcon: SizedBox(
              width: 100,
              child: Row(
                children: [
                  MessageUploadFile(
                      chatId: widget.args.chatId,
                      secretKey: key,
                      addUploadFile: _addUploadFile),
                  IconButton(
                    icon: const Icon(Icons.send_rounded),
                    color: Colors.deepOrange.shade400,
                    onPressed: _addMessage,
                    iconSize: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
