import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/pages/image_viewer.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/hive_boxes.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';

class ImageChatFile extends StatefulWidget {
  const ImageChatFile(
      {super.key,
      required this.secretKey,
      required this.image,
      required this.index,
      required this.images,
      required this.fileName});

  final String secretKey;
  final ChatFile image;
  final int index;
  final List<ChatFile> images;
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
    var boxPath = HiveBoxes()
        .chatFileUploaded
        .get("${widget.image.id}${jwtDecode().email}");
    if (boxPath == null) {
      ChatGrpc().downloadChatFileFn(context, widget.image.id, widget.fileName,
          widget.secretKey, setStatus);
    } else {
      setStatus(boxPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return downloaded
        ? Hero(
            tag: Image.file(File(path)),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.IMAGE_VIEWER,
                    arguments: ImageViewerArgs(
                        index: widget.index,
                        images: widget.images,
                        chatId: widget.image.chatId));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 1.3, bottom: 1.3),
                child: Positioned.fill(
                  top: 0,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.file(File(path)),
                  ),
                ),
              ),
            ),
          )
        : const Center(
            child: Icon(Icons.photo),
          );
  }
}
