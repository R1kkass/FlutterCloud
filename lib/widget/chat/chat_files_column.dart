import 'package:flutter/material.dart';
import 'package:TalkSpace/entities/chat/chat_file.dart';
import 'package:TalkSpace/entities/chat/grid_images.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/encrypt_message.dart';

class ChatFilesColumn extends StatefulWidget {
  const ChatFilesColumn(
      {super.key,
      required this.message,
      required this.secretKey,
      required this.status});

  final Message message;
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
    List<MessageFile> images = [];
    List<MessageFile> other = [];

    for (var messageFile in widget.message.messageFiles) {
      var typeFile = EncryptMessage()
          .decrypt(messageFile.fileName, widget.secretKey)
          .split(".")
          .last;
      if (reImg.hasMatch(typeFile) || reVideo.hasMatch(typeFile)) {
        images.add(messageFile);
      } else {
        other.add(messageFile);
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
            message: widget.message,
          ),
        Container(
          padding:
              EdgeInsets.only(left: 15, right: 15, top: widget.status ? 10 : 0),
          child: Column(
            children: [
              for (var messageFile in other)
                ChatFileComponent(
                    fileName: EncryptMessage()
                        .decrypt(messageFile.fileName, widget.secretKey),
                    messageFile: messageFile,
                    secretKey: widget.secretKey,
                    color: widget.status
                        ? Colors.blueAccent
                        : Colors.deepOrange.shade400, message: widget.message,),
            ],
          ),
        )
      ],
    );
  }
}
