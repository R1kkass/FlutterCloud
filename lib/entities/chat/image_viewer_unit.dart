import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/video_player.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/hive_boxes.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';

class ImageViewerUnit extends StatefulWidget {
  const ImageViewerUnit(
      {super.key,
      required this.image,
      required this.height,
      required this.secretKey});

  final ChatFile image;
  final String secretKey;
  final double height;

  @override
  State<ImageViewerUnit> createState() => _ImageViewerUnitState();
}

class _ImageViewerUnitState extends State<ImageViewerUnit> {
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
      ChatGrpc().downloadChatFileFn(
          context,
          widget.image.id,
          EncryptMessage().decrypt(widget.image.fileName, widget.secretKey),
          widget.secretKey,
          setStatus);
    } else {
      setStatus(boxPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    var reImg = RegExp("gif|jpe?g|tiff?|png|webp|bmp");
    var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");
    var typeFile = path.split(".").last;
    if (reImg.hasMatch(typeFile)) {
      return InteractiveViewer(
        child: SizedBox(
            height: MediaQuery.of(context).size.height - widget.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: FittedBox(
                    fit: BoxFit.contain, child: Image.file(File(path))))),
      );
    }

    if (reVideo.hasMatch(typeFile)) {
      return InteractiveViewer(
        child: VideoPlayer(
          video: File(path),
        ),
      );
    }

    return const SizedBox();
  }
}
