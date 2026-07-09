import 'dart:typed_data';

import 'package:TalkSpace/shared/video_player_bytes.dart';
import 'package:flutter/material.dart';

class ImageViewerUnitRead extends StatefulWidget {
  const ImageViewerUnitRead({
    super.key,
    required this.fileBytes,
    required this.typeFile,
    required this.height,
  });

  final Uint8List fileBytes;
  final double height;
  final String typeFile;

  @override
  State<ImageViewerUnitRead> createState() => _ImageViewerUnitReadUnitState();
}

class _ImageViewerUnitReadUnitState extends State<ImageViewerUnitRead> {
  bool downloaded = false;

  setStatus() {
    downloaded = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var reImg = RegExp("gif|jpe?g|tiff?|png|webp|bmp");
    var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");
    var typeFile = widget.typeFile;
    if (reImg.hasMatch(typeFile)) {
      return InteractiveViewer(
        child: SizedBox(
            height: MediaQuery.of(context).size.height - widget.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.memory(widget.fileBytes)))),
      );
    }
    if (reVideo.hasMatch(typeFile)) {
      return InteractiveViewer(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - widget.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: VideoPlayerBytes(
              type: typeFile,
              videoBytes: widget.fileBytes,
            ),
          ),
        ),
      );
    }

    return const SizedBox();
  }
}
