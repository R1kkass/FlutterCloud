import 'dart:io';

import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/services/file_size.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:open_file/open_file.dart';

class ChatFileUploadComponent extends StatefulWidget {
  const ChatFileUploadComponent(
      {super.key,
      required this.chatFile,
      required this.color});

  final MessageFile chatFile;
  final Color? color;

  @override
  State<ChatFileUploadComponent> createState() =>
      _ChatFileUploadComponentState();
}

class _ChatFileUploadComponentState extends State<ChatFileUploadComponent> {
  bool downloaded = false;

  @override
  void initState() {
    super.initState();
    downloaded = HiveBoxes
            .chatFileUploaded
            .get("${widget.chatFile.id}${jwtDecode().email}") !=
        null;
  }

  @override
  Widget build(BuildContext context) {
    openChatfile() async {
      await OpenFile.open(
        widget.chatFile.fileName,
      );
    }

    return Row(children: [
      GestureDetector(
        onTap: openChatfile,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          width: 35,
          height: 35,
          child: downloaded
              ? Icon(
                  Icons.insert_drive_file,
                  color: widget.color,
                )
              : Icon(
                  Icons.file_download_outlined,
                  color: widget.color,
                ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatFile.fileName.split(Platform.pathSeparator).last,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Text(fileSize(widget.chatFile.size.toInt()),
                style: const TextStyle(color: Colors.white, fontSize: 12))
          ],
        ),
      )
    ]);
  }
}
