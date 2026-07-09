import 'package:TalkSpace/data/sources/local/message_file_local_data_source.dart';
import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/domain/repository/message_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_file_view_model.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/message_file_default_provider.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:provider/provider.dart';

class ChatFile extends StatefulWidget {
  const ChatFile({super.key,
    required this.messageFile,
    required this.message,
    required this.color
  });

  final MessageFile messageFile;
  final Message message;
  final Color? color;

  @override
  State<ChatFile> createState() => _ChatFileState();
}

class _ChatFileState extends State<ChatFile> {
  @override
  Widget build(BuildContext context) {
    return MessageFileDefaultProvider(
      messageFile: widget.messageFile,
      child: Consumer<ChatFileViewModel>(builder: (context, viewModel, child) {
        return Row(children: [
          GestureDetector(
            onTap: viewModel.downloaded ?
                () => viewModel.openChatFile() :
                () => viewModel.downloadFile(widget.message),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              width: 35,
              height: 35,
              child: viewModel.downloaded
                  ? Icon(
                Icons.insert_drive_file,
                color: widget.color,
              )
                  : Icon(
                Icons.file_download_outlined,
                color: widget.color,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(viewModel.messageFile.fileName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Text(fileSize(widget.messageFile.size.toInt()),
                    style: const TextStyle(color: Colors.white, fontSize: 12))
              ],
            ),
          )
        ]);
      })
    );
  }
}
