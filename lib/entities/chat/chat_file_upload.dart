import 'package:flutter/material.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/file_size.dart';
import 'package:flutter_application_2/services/hive_boxes.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:open_file_plus/open_file_plus.dart';

class ChatFileUploadComponent extends StatefulWidget {
  const ChatFileUploadComponent(
      {super.key,
      required this.filePath,
      required this.chatFile,
      required this.color});

  final String filePath;
  final ChatFile chatFile;
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
    downloaded = HiveBoxes()
            .chatFileUploaded
            .get("${widget.chatFile.id}${jwtDecode().email}") !=
        null;
  }

  @override
  Widget build(BuildContext context) {
    openChatfile() async {
      await OpenFile.open(
        widget.filePath,
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
            Text(widget.filePath.split("/").last,
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
