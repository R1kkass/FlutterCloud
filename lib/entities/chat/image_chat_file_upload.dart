import 'dart:io';

import 'package:TalkSpace/presentation/views/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/cubit/upload_file_bloc.dart';
import 'package:TalkSpace/entities/chat/video_chat_file.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageChatFileUpload extends StatefulWidget {
  const ImageChatFileUpload(
      {super.key,
      required this.image,
      required this.index,
      required this.size,
      required this.message,
      required this.secretKey,
      required this.images,
      required this.filePath});

  final MessageFile image;
  final int index;
  final String secretKey;
  final double size;
  final Message message;
  final List<MessageFile> images;
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
    return BlocBuilder<UploadFileBloc, UploadFileState>(
        builder: (context, state) {
      return Container(
        clipBehavior: Clip.hardEdge,
        width: widget.size - 1,
        height: widget.size - 1,
        decoration: const BoxDecoration(),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRouter.IMAGE_VIEWER,
                arguments: ImageViewerArgs(
                    decrypt: false,
                    index: widget.index,
                    message: widget.message,
                    secretKey: widget.secretKey));
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
              child: Stack(
                fit: StackFit.expand,
                children: [
                  reVideo.hasMatch(typeFile)
                      ? VideoChatFile(path: widget.filePath)
                      : FittedBox(fit: BoxFit.cover, child: Image.file(file)),
                  state.chatUploadFiles[widget.message.id]
                              ?.successFiles[widget.filePath] !=
                          null
                      ? const SizedBox()
                      : const Positioned.fill(
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
        ),
      );
    });
  }
}
