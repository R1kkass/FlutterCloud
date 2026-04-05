import 'dart:io';

import 'package:TalkSpace/data/repository/message_grpc.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/entities/chat/video_player.dart';
import 'package:TalkSpace/data/repository/chat_grpc.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/encrypt_message.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:video_player/video_player.dart' as video_player;

class ImageViewerUnit extends StatefulWidget {
  const ImageViewerUnit(
      {super.key,
      required this.image,
      required this.height,
      required this.decrypt,
      required this.message,
      required this.secretKey});

  final MessageFile image;
  final String secretKey;
  final Message message;
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
    var boxPath = HiveBoxes
        .chatFileUploaded
        .get("${widget.image.id}${jwtDecode().email}");
    if (widget.decrypt) {
      if (boxPath == null) {
        MessageGrpc().downloadFileFn(
            context,
            widget.message,
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
          controller: video_player.VideoPlayerController.file(File(path)),
        ),
      );
    }

    return const SizedBox();
  }
}
