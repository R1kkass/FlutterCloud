import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';

class VideoChatFile extends StatefulWidget {
  const VideoChatFile({super.key, required this.path});
  final String path;

  @override
  State<VideoChatFile> createState() => _VideoChatFileState();
}

class _VideoChatFileState extends State<VideoChatFile> {
  Uint8List uint8list = Uint8List.fromList([]);

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
    if (uint8list.isNotEmpty) {
      return FittedBox(
          fit: BoxFit.cover,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.memory(uint8list, frameBuilder:
                  ((context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: frame != null
                      ? child
                      : const Center(
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: CircularProgressIndicator(strokeWidth: 6),
                          ),
                        ),
                );
              })),
              SizedBox(
                height: 50,
                width: 50,
                child: Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: const Icon(
                      CupertinoIcons.play_arrow_solid,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              )
            ],
          ));
    }

    return SizedBox(
      height: 50,
      width: 50,
      child: Positioned.fill(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: const Icon(
            CupertinoIcons.play_arrow_solid,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
