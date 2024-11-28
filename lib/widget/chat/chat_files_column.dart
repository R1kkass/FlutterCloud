import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/chat_file.dart';
import 'package:flutter_application_2/entities/chat/grid_images.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';

class ChatFilesColumn extends StatefulWidget {
  const ChatFilesColumn(
      {super.key,
      required this.chatFiles,
      required this.secretKey,
      required this.status});

  final List<ChatFile> chatFiles;
  final String secretKey;
  final bool status;

  @override
  State<ChatFilesColumn> createState() => _ChatFilesColumnState();
}

class _ChatFilesColumnState extends State<ChatFilesColumn> {
  var reImg = RegExp("gif|jpe?g|tiff?|png|webp|bmp");
  var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");


  @override
  Widget build(BuildContext context) {
    List<ChatFile> images = [];
    List<ChatFile> other = [];

    for (var chatFile in widget.chatFiles) {
      var typeFile = EncryptMessage()
          .decrypt(chatFile.fileName, widget.secretKey)
          .split(".")
          .last;
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
          GridImages(
            secretKey: widget.secretKey,
            images: images,
          ),
        Container(
          padding:
              EdgeInsets.only(left: 15, right: 15, top: widget.status ? 10 : 0),
          child: Column(
            children: [
              for (var chatFile in other)
                ChatFileComponent(
                    fileName: EncryptMessage()
                        .decrypt(chatFile.fileName, widget.secretKey),
                    chatFile: chatFile,
                    secretKey: widget.secretKey,
                    color: widget.status
                        ? Colors.blueAccent
                        : Colors.deepOrange.shade400),
            ],
          ),
        )
      ],
    );
  }
}
