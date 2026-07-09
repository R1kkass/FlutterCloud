import 'package:TalkSpace/presentation/viewmodels/messenger/message/file_gallery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/file_gallery.dart';
import 'package:provider/provider.dart';

class MessageUploadFile extends StatefulWidget {
  final int chatId;

  const MessageUploadFile({
    super.key,
    required this.chatId
  });

  @override
  State<StatefulWidget> createState() => _MessageUploadFileState();
}

class _MessageUploadFileState extends State<MessageUploadFile> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FileGalleryViewModel>(
      builder: (_, viewModel, child) {
        return RotationTransition(
          turns: const AlwaysStoppedAnimation(-0.15),
          child: IconButton(
            icon: const Icon(
              Icons.attachment,
              size: 27,
            ),
            color: Colors.deepOrange.shade400,
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (_) {
                  return ChangeNotifierProvider.value(
                    value: viewModel,
                    child: FileGallery(
                      chatId: widget.chatId,
                    )
                  );
                },
              ).then((_) {
                viewModel.clearSelectedFiles();
              });
            },
            iconSize: 25,
          ),
        );
      },
    );
  }
}
