import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encode_file.dart';
import 'package:flutter_application_2/services/file_size.dart';
import 'package:flutter_application_2/services/get_download_path.dart';
import 'package:flutter_application_2/services/hive_boxes.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:open_file_plus/open_file_plus.dart';

class ChatFileComponent extends StatefulWidget {
  const ChatFileComponent(
      {super.key,
      required this.fileName,
      required this.chatFile,
      required this.secretKey,
      required this.color});

  final String fileName;
  final String secretKey;
  final ChatFile chatFile;
  final Color? color;

  @override
  State<ChatFileComponent> createState() => _ChatFileComponentState();
}

class _ChatFileComponentState extends State<ChatFileComponent> {
  bool downloaded = false;

  @override
  void initState() {
    super.initState();
    downloaded = HiveBoxes().chatFileUploaded.get(widget.chatFile.id) != null;
  }

  @override
  Widget build(BuildContext context) {
    downloadChatFile() {
      List<int> chunks = [];

      try {
        var downloadFile = ChatGrpc().downloadChatFile(
          DownloadFileChatRequest(
            chatFileId: widget.chatFile.id,
          ),
        );
        downloadFile.listen((e) async {
          try {
            chunks = [...chunks, ...e.chunk];

            if (e.progress >= 100) {
              var downloadPath = await getDownloadPath() ?? "";
              EncodeFile.decryptByte(
                  Uint8List.fromList(chunks),
                  "$downloadPath/${widget.fileName}",
                  widget.secretKey.substring(0, 32));
              HiveBoxes()
                  .chatFileUploaded
                  .put(widget.chatFile.id, "$downloadPath/${widget.fileName}");
              downloaded = true;
              setState(() {});
            }
          } catch (_) {
            showToast(context, 'Не удалось скачать файл: ${widget.fileName}');
          }
        });
      } catch (e) {
        showToast(context, 'Не удалось скачать файл: ${widget.fileName}');
      }
    }

    openChatfile() async {
      var downloadPath = await getDownloadPath() ?? "";

      await OpenFile.open(
        "$downloadPath/${widget.fileName}",
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
            Text(fileSize(widget.chatFile.size.toInt()),
                style: const TextStyle(color: Colors.white, fontSize: 12))
          ],
        ),
      )
    ]);
  }
}
