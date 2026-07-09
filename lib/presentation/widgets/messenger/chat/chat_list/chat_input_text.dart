import 'package:TalkSpace/domain/model/entities/chat.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_view_model.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/chat_input.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/upload_files.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatInputText extends StatelessWidget {
  final Chat chat;

  const ChatInputText({
    super.key,
    required this.chat
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();

    return ChatInput(
      controller: text,
      title: "Сообщение",
      error: "Введите сообщение",
      suffixIcon: SizedBox(
        width: 100,
        child: Row(
          children: [
            MessageUploadFile(
              chatId: chat.id,
            ),
            IconButton(
              icon: const Icon(Icons.send_rounded),
              color: Colors.deepOrange.shade400,
              onPressed: () async {
                await Provider.of<ChatViewModel>(context, listen: false).addMessage(text.text);
                text.clear();
              },
              iconSize: 25,
            ),
          ],
        ),
      ),
    );
  }
}