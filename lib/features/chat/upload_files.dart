import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/chat/file_galery.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'dart:isolate';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';

class MessageUploadFile extends StatefulWidget {
  final int chatId;
  final String secretKey;
  const MessageUploadFile(
      {super.key, required this.chatId, required this.secretKey});

  @override
  State<MessageUploadFile> createState() => _MessageUploadFileState();
}

class _MessageUploadFileState extends State<MessageUploadFile> {
  _functionCreate(Map<String, bool> selectedFiles, String text) async {
    // var mainContext =
    //     NavigationService.navigatorKey.currentContext as BuildContext;
    var chatId = widget.chatId;
    var fileName = selectedFiles.keys.toList()[0].split("/").last;
    var key = widget.secretKey;
    var filePath = selectedFiles.keys.toList()[0];
    var hashText = EncryptMessage().encrypt(text, key);
    var argsStream = await Isolate.run(() => ChatGrpc().createStreamArg(
        ArgsForStream(
            filePath: filePath,
            secretKey: key.substring(0, 32),
            request: UploadFileChat(
                fileName: fileName, chatId: chatId, text: hashText.base64))));
    // if (mainContext.read<ContentBloc>().state.uploadFile[folderId]?[id] !=
    //     null) {
    var callback = ChatGrpc().uploadFile(argsStream);

    // mainContext.read<ContentBloc>().add(
    //     UploadSetCallback(id: id, folderId: folderId, callback: callback));
    await callback;
    // mainContext
    //     .read<ContentBloc>()
    //     .add(UploadFileRemove(folderId: folderId, id: id));
    // ContentBloc.defaultRequestFile(folderId, mainContext);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(0.07),
      child: IconButton(
        icon: const Icon(Icons.attach_file),
        color: Colors.deepOrange.shade400,
        onPressed: () {
          // selectFile();
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return FileGallery(
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
