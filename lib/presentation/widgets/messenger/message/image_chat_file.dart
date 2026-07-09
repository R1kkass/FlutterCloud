import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/domain/model/enums/file_download_status.enum.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_file_view_model.dart';
import 'package:TalkSpace/presentation/views/image_viewer.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/image_file.dart';
import 'package:TalkSpace/services/get_file_name.dart';
import 'package:TalkSpace/shared/error_modal.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/video_chat_file.dart';
import 'package:provider/provider.dart';

class ImageChatFile extends StatefulWidget {
  const ImageChatFile({
    super.key,
    required this.index,
    required this.size,
    required this.message
  });

  final int index;
  final double size;
  final Message message;

  @override
  State<ImageChatFile> createState() => _ImageChatFileState();
}

class _ImageChatFileState extends State<ImageChatFile> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((e) async {
      await Provider.of<ChatFileViewModel>(context, listen: false).downloadFile(widget.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatFileViewModel>(builder: (context, viewModel, child) {
      if (viewModel.downloaded) {
        var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");
        var typeFile = getFileExtension(viewModel.file!);
        return Padding(
          padding: const EdgeInsets.only(left: 1.3, bottom: 1.3),
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: widget.size - 1,
            height: widget.size - 1,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
            ),
            child: InkWell(
              onTap: () {
                if (
                  (viewModel.messageFile.downloadMessage == null || viewModel.messageFile.downloadMessage?.status == FileDownloadStatusEnum.success) &&
                    viewModel.messageFile.uploadFileMessage == null
                ) {
                  Navigator.of(context).pushNamed(AppRouter.IMAGE_VIEWER,
                      arguments: ImageViewerArgs(
                        index: widget.index,
                        message: widget.message,
                      ));
                }
              },
              child: Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: true,
                  key: Key(viewModel.file?.path ?? "0"),
                  replacement: const SizedBox.shrink(
                    child: Icon(Icons.photo),
                  ),
                  child:
                  viewModel.file == null ?
                  ErrorModal()
                      :
                  reVideo.hasMatch(typeFile)
                      ? VideoChatFile(path: viewModel.file!.path)
                      : ImageFile(
                    file: viewModel.file!,
                    uploadFileMessage: viewModel.messageFile.uploadFileMessage,
                  )
              ),
            ),
          ),
        );
      }
      return Container(
        width: widget.size - 1,
        height: widget.size - 1,
        color: const Color.fromRGBO(255, 255, 255, 0.2),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            value: viewModel.messageFile.downloadMessage?.percentDownload,
          ),
        ) ,
      );
    },);
  }
}
