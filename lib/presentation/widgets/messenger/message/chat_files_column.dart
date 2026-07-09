import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/chat_file.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/gallery/grid_images.dart';

var reImg = RegExp("gif|jpe?g|tiff?|png|webp|bmp");
var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");

class ChatFilesColumn extends StatelessWidget {
  const ChatFilesColumn(
      {super.key,
      required this.message,
      required this.status});

  final Message message;
  final bool status;

  @override
  Widget build(BuildContext context) {
    List<MessageFile> images = [];
    List<MessageFile> other = [];

    for (var messageFile in message.messageFiles) {
      var typeFile = messageFile.fileName.split(".").last;
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
            images: images,
            message: message,
          ),
        Container(
          padding:
          EdgeInsets.only(left: 15, right: 15, top: status ? 10 : 0),
          child: Column(
            children: [
              for (var messageFile in other)
                ChatFile(
                  messageFile: messageFile,
                  color: status
                      ? Colors.blueAccent
                      : Colors.deepOrange.shade400, message: message,),
            ],
          ),
        )
      ],
    );
  }
}
