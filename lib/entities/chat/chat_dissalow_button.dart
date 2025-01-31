import 'package:TalkSpace/features/chat/chat_accept.dart';
import 'package:TalkSpace/grpc/chat_grpc.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';

class ChatDissalowButton extends ChatAcceptImpl {
  const ChatDissalowButton(
      {super.key, required super.chat, required super.setChats});

  @override
  State<ChatDissalowButton> createState() => _ChatDissalowButtonState();
}

class _ChatDissalowButtonState extends State<ChatDissalowButton> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (!isLoading) {
            await _dissalow();
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
            : const Icon(Icons.clear));
  }

  Future _dissalow() async {
    try {
      await _dissalowChat();
    } catch (e) {
      showUnsuccessToast("Не удалось отклонить");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future _dissalowChat() async {
    setState(() {
      isLoading = true;
    });
    var chat = widget.chat;
    var chatsUser = (await ChatGrpc()
            .dissalowChat(DissalowChatRequest(chatId: chat.chat.id)))
        .chats;
    widget.setChats(chatsUser);
  }
}
