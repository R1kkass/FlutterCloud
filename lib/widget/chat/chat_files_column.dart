import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/chat_file.dart';
import 'package:flutter_application_2/entities/chat/image_chat_file.dart';
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

  int _length(count) {
    if (count % 3 == 0) {
      return 3;
    }
    if (count > 1) {
      return 2;
    }
    return 1;
  }

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
      children: [
        if (images.isNotEmpty)
          SizedBox(
            width: MediaQuery.of(context).size.width - 70,
            height: (MediaQuery.of(context).size.width - 70) /
                _length(images.length),
            child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _length(images.length),
                ),
                children: [
                  for (var img in images)
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 70) /
                              _length(images.length) -
                          1,
                      child: ImageChatFile(
                        secretKey: widget.secretKey,
                        chatFile: img,
                        fileName: EncryptMessage()
                            .decrypt(img.fileName, widget.secretKey),
                      ),
                    ),
                ]),
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
