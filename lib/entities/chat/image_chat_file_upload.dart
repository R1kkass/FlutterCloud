import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/entities/chat/video_chat_file.dart';
import 'package:flutter_application_2/pages/image_viewer.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';

class ImageChatFileUpload extends StatefulWidget {
  const ImageChatFileUpload(
      {super.key,
      required this.image,
      required this.index,
      required this.images,
      required this.filePath});

  final ChatFile image;
  final int index;
  final List<ChatFile> images;
  final String filePath;

  @override
  State<ImageChatFileUpload> createState() => _ImageChatFileUploadState();
}

class _ImageChatFileUploadState extends State<ImageChatFileUpload> {
  bool downloaded = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");
    File file = File(widget.filePath);
    var typeFile = file.path.split("/").last.split(".").last;
    return InkWell(
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
              ? VideoChatFile(path: widget.filePath)
              : Stack(
                  children: [
                    FittedBox(fit: BoxFit.fill, child: Image.file(file)),
                    const Positioned.fill(
                      child: Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}