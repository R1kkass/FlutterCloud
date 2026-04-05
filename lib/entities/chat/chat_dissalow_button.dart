import 'package:TalkSpace/features/chat/chat_accept.dart';
import 'package:TalkSpace/data/repository/chat_grpc.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
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
    var chatGrpc = ChatGrpc();
    await chatGrpc.disallowChat(DisallowChatRequest(chatId: chat.id));
    widget.setChats((await chatGrpc.getUnSuccessChats()).chats);
  }
}
