import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_file_view_model.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/video_player.dart';
import 'package:TalkSpace/services/get_file_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart' as video_player;

class ImageViewerUnit extends StatefulWidget {
  const ImageViewerUnit({
    super.key,
    required this.height,
    required this.message,
  });

  final Message message;
  final double height;

  @override
  State<ImageViewerUnit> createState() => _ImageViewerUnitState();
}

var reImg = RegExp("gif|jpe?g|tiff?|png|webp|bmp");
var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");

class _ImageViewerUnitState extends State<ImageViewerUnit> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((e) async {
      await Provider.of<ChatFileViewModel>(context, listen: false).downloadFile(widget.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatFileViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.file == null) {
          return const SizedBox();
        }
        var typeFile = getFileExtension(viewModel.file!);

        if (reImg.hasMatch(typeFile)) {
          return InteractiveViewer(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - widget.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child:
                FittedBox(
                    fit: BoxFit.contain,
                    child: Image.file(viewModel.file!)
                )
              )
            ),
          );
        }

        if (reVideo.hasMatch(typeFile)) {
          return InteractiveViewer(
            child: VideoPlayer(
              controller: video_player.VideoPlayerController.file(viewModel.file!),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
