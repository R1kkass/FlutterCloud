import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/rename_file_view_model.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/dialog_rename.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RenameFileButton extends StatefulWidget {
  const RenameFileButton({super.key, required this.file});

  final File file;

  @override
  State<RenameFileButton> createState() => _RenameFileButtonState();
}

class _RenameFileButtonState extends State<RenameFileButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RenameFileViewModel>(builder: (context, viewModel, child) {
      renameFile(String name) async {
        try {
          await viewModel.rename(widget.file, name);
          showSuccessToast("Файл переименован");
        } catch (e) {
          showUnsuccessToast("Не удалось переименовать файл");
        }
      }

      return TextButton(
        onPressed: () async {
          showDialogRename(
            callback: renameFile,
            context: context,
            title: "Переименование файла",
            hintText: "Название файла",
          );
        },
        child: const Row(
          children: [
            Icon(Icons.mode_edit_outline_outlined, size: 30),
            SizedBox(
              width: 15,
            ),
            Text(
              "Переименовать",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      );
    });
  }
}
