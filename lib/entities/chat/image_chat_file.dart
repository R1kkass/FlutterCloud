import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/entities/chat/video_chat_file.dart';
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
  late File file;
  bool downloaded = false;
  bool visible = false;
  var decodedImage;
  setStatus(String pathFile) async {
    file = File(pathFile);
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
    var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");
    var typeFile = file.path.split("/").last.split(".").last;
    return downloaded
        ? InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.IMAGE_VIEWER,
                  arguments: ImageViewerArgs(
                      index: widget.index,
                      images: widget.images,
                      chatId: widget.image.chatId));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 1.3, bottom: 1.3),
              child: Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: true,
                key: Key(file.path),
                replacement: const SizedBox.shrink(
                  child: Icon(Icons.photo),
                ),
                child: reVideo.hasMatch(typeFile)
                    ? VideoChatFile(path: file.path)
                    : FittedBox(fit: BoxFit.fill, child: Image.file(file)),
              ),
            ),
          )
        : const SizedBox(height: 100, width: 100);
  }
}
