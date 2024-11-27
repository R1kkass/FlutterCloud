import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/hive_boxes.dart';

class ImageChatFile extends StatefulWidget {
  const ImageChatFile(
      {super.key,
      required this.secretKey,
      required this.chatFile,
      required this.fileName});

  final String secretKey;
  final ChatFile chatFile;
  final String fileName;

  @override
  State<ImageChatFile> createState() => _ImageChatFileState();
}

class _ImageChatFileState extends State<ImageChatFile> {
  String path = "";
  bool downloaded = false;

  setStatus(pathFile) {
    path = pathFile;
    downloaded = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    var boxPath = HiveBoxes().chatFileUploaded.get(widget.chatFile.id);
    if (boxPath == null) {
      ChatGrpc().downloadChatFileFn(context, widget.chatFile.id,
          widget.fileName, widget.secretKey, setStatus);
    } else {
      setStatus(boxPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 0,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.file(File(path)),
      ),
    );
  }
}
