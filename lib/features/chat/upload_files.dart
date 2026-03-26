import 'dart:io';
import 'package:TalkSpace/gen/dart/message/message.pb.dart';
import 'package:TalkSpace/gen/dart/user/user.pb.dart';
import 'package:TalkSpace/grpc/message_grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/cubit/upload_file_bloc.dart';
import 'package:TalkSpace/features/chat/file_gallery.dart';
import 'dart:isolate';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/encrypt_message.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  MessageGrpc messageGrpc = MessageGrpc();

  int countFiles = 0;
  _isolate(
      {required selectFile,
      required key,
      required UploadFileMessageRequest message,
      required hashText,
      required selectedFilesLength}) async {
    try {
      var fileName = selectFile.split("/").last;
      var filePath = selectFile;
      var hashFileName = EncryptMessage().encrypt(fileName, key);
      var argsStream = await Isolate.run(() => MessageGrpc().createStreamArg(
          ArgsForStream(
              filePath: filePath,
              secretKey: key.substring(0, 32),
              request: UploadFileMessageRequest(
                  fileName: hashFileName.base64,
                  chatId: message.chatId,
                  messageId: message.messageId,
                  text: hashText))));

      await messageGrpc.uploadFile(argsStream);
      countFiles++;
      if (countFiles == selectedFilesLength) {
        widget.addUploadFile(message.chatId);
      }
      context
          .read<UploadFileBloc>()
          .add(SuccessUploadFile(filePath: filePath, id: message.messageId));
    } catch (e) {
      showUnsuccessToast("Не удалось загрузить файлы");
      context
          .read<UploadFileBloc>()
          .add(RemoveUploadFile(messageId: message.messageId));
    }
  }

  _functionCreate(Map<String, bool> selectedFiles, String text) async {
    var chatId = widget.chatId;
    var key = widget.secretKey;
    var hashText = text != "" ? EncryptMessage().encrypt(text, key).base64 : "";
    countFiles = 0;
    Navigator.pop(context);
    _messageController.text = "";

    var message = await messageGrpc.createFileMessage(
        CreateFileMessageRequest(text: hashText, chatId: chatId));

    List<MessageFile> chatFiles = [];

    for (var selectFile in selectedFiles.keys) {
      var file = File(selectFile);
      chatFiles.add(MessageFile(
          id: 0,
          fileName: selectFile,
          size: Int64(file.statSync().size)));
      _isolate(
          selectedFilesLength: selectedFiles.keys.length,
          key: key,
          selectFile: selectFile,
          hashText: hashText,
          message: UploadFileMessageRequest(
            chatId: chatId,
            messageId: message.messageId,
          ));
    }

    context.read<UploadFileBloc>().add(AddUploadFile(
        id: message.messageId,
        text: hashText,
        chatFiles: chatFiles,
        createdAt: message.createdAt,
        updatedAt: message.updatedAt,
        successFiles: {},
        user: User(
          email: jwtDecode().email,
          name: "",
          uuid: "",
        )));
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
