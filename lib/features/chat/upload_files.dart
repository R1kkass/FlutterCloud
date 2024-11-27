import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/chat/file_galery.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'dart:isolate';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/shared/toast.dart';

class MessageUploadFile extends StatefulWidget {
  final int chatId;
  final String secretKey;
  final void Function(int) addUploadFile;
  const MessageUploadFile(
      {super.key,
      required this.chatId,
      required this.secretKey,
      required this.addUploadFile});

  @override
  State<MessageUploadFile> createState() => _MessageUploadFileState();
}

class _MessageUploadFileState extends State<MessageUploadFile> {
  final TextEditingController _messageController = TextEditingController();
  List<Future<Empty>> filesNeedUploading = [];
  int countFiles = 0;
  _isolate(
      {required selectFile,
      required key,
      required message,
      required hashText,
      required selectedFilesLength}) async {
    try {
      var fileName = selectFile.split("/").last;
      var filePath = selectFile;
      var hashFileName = EncryptMessage().encrypt(fileName, key);
      var argsStream = await Isolate.run(() => ChatGrpc().createStreamArg(
          ArgsForStream(
              filePath: filePath,
              secretKey: key.substring(0, 32),
              request: UploadFileChatRequest(
                  fileName: hashFileName.base64,
                  messageId: message.messageId,
                  text: hashText))));

      await ChatGrpc().uploadFile(argsStream);
      countFiles++;
      if (countFiles == selectedFilesLength) {
        widget.addUploadFile(message.messageId);
      }
    } catch (e) {
      showToast(context, "Не удалось загрузить файлы");
    }
  }

  _functionCreate(Map<String, bool> selectedFiles, String text) async {
    var chatId = widget.chatId;
    var key = widget.secretKey;
    var hashText = text != "" ? EncryptMessage().encrypt(text, key).base64 : "";
    countFiles = 0;
    Navigator.pop(context);
    _messageController.text = "";

    var message = await ChatGrpc().createFileMessage(
        CreateFileMessageRequest(text: hashText, chatId: chatId));

    for (var selectFile in selectedFiles.keys) {
      _isolate(
          selectedFilesLength: selectedFiles.keys.length,
          key: key,
          selectFile: selectFile,
          hashText: hashText,
          message: message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(-0.15),
      child: IconButton(
        icon: const Icon(
          Icons.attachment,
          size: 27,
        ),
        color: Colors.deepOrange.shade400,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return FileGallery(
                  textController: _messageController,
                  chatId: widget.chatId,
                  secretKey: widget.secretKey,
                  functionCreate: _functionCreate);
            },
          );
        },
        iconSize: 25,
      ),
    );
  }
}
