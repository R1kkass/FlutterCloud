import 'dart:io';
import 'dart:typed_data';

import 'package:TalkSpace/presentation/viewmodels/messenger/message/file_gallery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';

class FileGalleryVideoUnit extends StatefulWidget {
  const FileGalleryVideoUnit({super.key, required this.path,});

  final String path;

  @override
  State<FileGalleryVideoUnit> createState() => _FileGalleryVideoUnitState();
}

class _FileGalleryVideoUnitState extends State<FileGalleryVideoUnit> {
  bool show = false;
  VideoPlayerController? controller;
  Uint8List uint8list = Uint8List.fromList([]);
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((e) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    VideoThumbnail.thumbnailData(
      video: widget.path,
      imageFormat: ImageFormat.PNG,
      maxWidth: 0,
      quality: 0,
    ).then((e) {
      if (uint8list.isEmpty) {
        uint8list = e;
        setState(() {});
      }
    });

    var minutes = controller!.value.duration.inSeconds ~/ 60;
    var seconds = controller!.value.duration.inSeconds % 60;
    return Consumer<FileGalleryViewModel>(builder: (context, viewModel, child) {
      var index = viewModel.getIndex(widget.path) ?? "";

      return Stack(
        children: [
          Positioned.fill(
            top: 0,
            child: VisibilityDetector(
              key: Key(widget.path),
              onVisibilityChanged: (v) {
                if (mounted) {
                  show = v.visibleFraction > 0.5;
                  setState(() {});
                }
              },
              child: show
                  ? AnimatedScale(
                duration: const Duration(milliseconds: 100),
                scale: viewModel.selectedFiles[widget.path] != null ? .9 : 1,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.memory(uint8list),
                ),
              )
                  : const Center(
                child: Icon(Icons.image),
              )
            )
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: viewModel.selectedFiles[widget.path] != null
                      ? Colors.blueAccent
                      : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Text("$index",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ),
              onTap: () {
                viewModel.selectFile(widget.path);
              },
            ),
          ),
          Positioned(
              bottom: 5,
              left: 5,
              child: Container(
                padding: const EdgeInsets.only(left: 2, right: 2),
                decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    const Icon(
                      Icons.play_arrow,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      "$minutes:${MessageDate().addZero(seconds)}",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ],
      );
    });
  }
}
