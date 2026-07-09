import 'package:TalkSpace/presentation/viewmodels/messenger/message/file_gallery_view_model.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/chat_input.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/count_files_selected.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/file_gallery_type.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/tabs_type_file_picker.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FileGallery extends StatefulWidget {
  final int chatId;
  const FileGallery({super.key, required this.chatId});

  @override
  State<StatefulWidget> createState() => _FileGalleryState();
}

class _FileGalleryState extends State<FileGallery> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FileGalleryViewModel>(builder: (context, viewModel, child) {
      final TextEditingController messageController = TextEditingController();

      sendMessage() async {
        try {
          viewModel.uploadFileViewModel.create(
            viewModel.selectedFiles,
            messageController.text, widget.chatId);
          messageController.clear();
          Navigator.pop(context);
        } catch (e) {
          showUnsuccessToast("Не удалось загрузить файлы");
        }
      }

      var height = MediaQuery
          .of(context)
          .size
          .height;

      return AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          height: viewModel.sizeModal ? height - 100 : height / 1.7,
          child: Column(children: [
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
            ),
            Row(
              children: [
                CountFilesSelected(count: viewModel.count,)
              ],
            ),
            FileGalleryType(action: viewModel.setCurrentFileType),
            TabsTypeFilePicker(
                selectedTabFilePicker: viewModel.selectedTabFilePicker),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                height: viewModel.messageInputHeight,
                child: Focus(
                  onFocusChange: (hasFocus) {
                    viewModel.inputFocused = hasFocus;
                    viewModel.setMessageInputHeight();
                  },
                  child: ChatInput(
                    controller: messageController,
                    fieldSubmit: (_) => sendMessage(),
                    title: "Сообщение",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send_rounded),
                      color: Colors.deepOrange.shade500,
                      onPressed: sendMessage,
                      iconSize: 25,
                    ),
                    error: ""
                  ),
                ),
              )
            )
          ]),
        ),
      );
    });
  }
}
