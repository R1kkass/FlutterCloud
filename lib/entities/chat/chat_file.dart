import 'dart:typed_data';

import 'package:TalkSpace/gen/dart/message/message.pb.dart';
import 'package:TalkSpace/data/repository/message_grpc.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/data/repository/chat_grpc.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/encode_file.dart';
import 'package:TalkSpace/services/file_size.dart';
import 'package:TalkSpace/services/get_download_path.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:open_file/open_file.dart';

class ChatFileComponent extends StatefulWidget {
  const ChatFileComponent(
      {super.key,
      required this.fileName,
      required this.messageFile,
      required this.message,
      required this.secretKey,
      required this.color});

  final String fileName;
  final String secretKey;
  final MessageFile messageFile;
  final Message message;
  final Color? color;

  @override
  State<ChatFileComponent> createState() => _ChatFileComponentState();
}

class _ChatFileComponentState extends State<ChatFileComponent> {
  bool downloaded = false;

  @override
  void initState() {
    super.initState();
    downloaded = HiveBoxes
            .chatFileUploaded
            .get("${widget.messageFile.id}${jwtDecode().email}") !=
        null;
  }

  @override
  Widget build(BuildContext context) {
    downloadChatFile() {
      List<int> chunks = [];

      try {
        MessageGrpc().downloadFile(
          DownloadFileMessageRequest(
            messageFileId: widget.messageFile.id,
          ),
          (e) async {
            try {
              chunks = [...chunks, ...e.chunk];

              if (e.progress >= 100) {
                var downloadPath = await getDownloadPath() ?? "";
                var path = "$downloadPath/${widget.fileName}";
                var file = EncodeFile.decryptByteCreateFile(Uint8List.fromList(chunks),
                    path, widget.secretKey.substring(0, 32));
                HiveBoxes
                    .chatFileUploaded
                    .put("${widget.messageFile.id}${jwtDecode().email}", file.path);
                downloaded = true;
                setState(() {});
              }
            } catch (_) {
              showUnsuccessToast('Не удалось скачать файл: ${widget.fileName}');
            }
          }
        );
      } catch (e) {
        showUnsuccessToast('Не удалось скачать файл: ${widget.fileName}');
      }
    }

    openChatfile() async {
      await OpenFile.open(
        HiveBoxes
            .chatFileUploaded
            .get("${widget.messageFile.id}${jwtDecode().email}"),
      );
    }

    return Row(children: [
      GestureDetector(
        onTap: downloaded ? openChatfile : downloadChatFile,
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
            Text(widget.fileName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Text(fileSize(widget.messageFile.size.toInt()),
                style: const TextStyle(color: Colors.white, fontSize: 12))
          ],
        ),
      )
    ]);
  }
}
