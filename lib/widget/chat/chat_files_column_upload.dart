import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/chat_file_upload.dart';
import 'package:flutter_application_2/entities/chat/grid_images_upload.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';

class ChatFilesUploadColumn extends StatefulWidget {
  const ChatFilesUploadColumn(
      {super.key,
      required this.chatFiles,
      required this.status,
      required this.messageId});

  final List<ChatFile> chatFiles;
  final bool status;
  final int messageId;

  @override
  State<ChatFilesUploadColumn> createState() => _ChatFilesUploadColumnState();
}

class _ChatFilesUploadColumnState extends State<ChatFilesUploadColumn> {
  var reImg = RegExp("gif|jpe?g|tiff?|png|webp|bmp");
  var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");

  @override
  Widget build(BuildContext context) {
    List<ChatFile> images = [];
    List<ChatFile> other = [];

    for (var chatFile in widget.chatFiles) {
      var typeFile = chatFile.fileName.split(".").last;
      if (reImg.hasMatch(typeFile) || reVideo.hasMatch(typeFile)) {
        images.add(chatFile);
      } else {
        other.add(chatFile);
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (images.isNotEmpty)
          GridImagesUpload(
            messageId: widget.messageId,
            images: images,
          ),
        Container(
          padding:
              EdgeInsets.only(left: 15, right: 15, top: widget.status ? 10 : 0),
          child: Column(
            children: [
              for (var chatFile in other)
                ChatFileUploadComponent(
                    filePath: chatFile.fileName,
                    chatFile: chatFile,
                    color: Colors.blueAccent),
            ],
          ),
        )
      ],
    );
  }
}
