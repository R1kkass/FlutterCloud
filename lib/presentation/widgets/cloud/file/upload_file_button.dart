import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/upload_file_button_view_model.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadFileButton extends StatefulWidget {
  final Folder? folder;

  const UploadFileButton({super.key, required this.folder});

  @override
  State<UploadFileButton> createState() => _UploadFileButtonState();
}

class _UploadFileButtonState extends State<UploadFileButton> {
  int idFileUpload = 0;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<UploadFileButtonViewModel>(builder: (context, viewModel, child) {
      selectFile() async {
        try {
          var isSelected = await viewModel.selectFile(widget.folder?.id);
          if (!isSelected) {
            showToast("Файл не выбран");
          }
        } catch (e) {
          showUnsuccessToast("Не удалось загрузить файл");
        }
      }

      return ElevatedButton(
        onPressed: selectFile,
        child: const SizedBox(
          height: 50,
          child: Column(
            children: [Icon(Icons.upload_file), Text("Добавить файл")],
          ),
        ),
      );
    });
  }
}
