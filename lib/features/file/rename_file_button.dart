import 'package:TalkSpace/entities/folder/dialog_create_folder.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/proto/files/files.pb.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';

class RenameFileButton extends StatefulWidget {
  const RenameFileButton({super.key, required this.file});

  final FileFind file;

  @override
  State<RenameFileButton> createState() => _RenameFileButtonState();
}

class _RenameFileButtonState extends State<RenameFileButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        showDialogRename(
          folderId: widget.file.folderId,
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
  }

  renameFile(String name) async {
    try {
      await _renameFile(name);
    } catch (e) {
      showUnsuccessToast(
          "Не удалось переименовать файл");
    }
  }

  _renameFile(String name) async {
    await FilesGrpc().renameFile(RenameFileRequest(
      folderId: widget.file.folderId,
      fileId: widget.file.id,
      name: name,
    ));
    showSuccessToast(
         "Файл переименован");
  }
}
