import 'dart:io';

import 'package:flutter/material.dart';
import 'package:TalkSpace/entities/chat/video_player.dart';
import 'package:TalkSpace/grpc/chat_grpc.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:TalkSpace/services/encrypt_message.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';

class ImageViewerUnit extends StatefulWidget {
  const ImageViewerUnit(
      {super.key,
      required this.image,
      required this.height,
      required this.decrypt,
      required this.secretKey});

  final ChatFile image;
  final String secretKey;
  final bool decrypt;
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
    if (widget.decrypt) {
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
    } else {
      setStatus(widget.image.fileName);
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
