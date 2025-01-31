import 'package:TalkSpace/entities/folder/dialog_create_folder.dart';
import 'package:TalkSpace/grpc/folder_grpc.dart';
import 'package:TalkSpace/pages/home.dart';
import 'package:TalkSpace/proto/folder/folder.pbgrpc.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';

class RenameFolderButton extends StatefulWidget {
  const RenameFolderButton({super.key, required this.folderId});

  final int folderId;

  @override
  State<RenameFolderButton> createState() => _RenameFolderButtonState();
}

class _RenameFolderButtonState extends State<RenameFolderButton> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;
    renameFolder(String name) async {
      await FolderGrpc().renameFolder(
          RenameFolderRequest(folderId: widget.folderId, name: name));
      showSuccessToast("Папка переименована");
    }

    rename(String name) async {
      try {
        await renameFolder(name);
      } catch (e) {
        showUnsuccessToast("Не удалось переименовать папку");
      }
    }

    return TextButton(
      onPressed: () async {
        showDialogRename(
          folderId: args?.id ?? 0,
          context: context,
          callback: rename,
          title: "Переименование папки",
          hintText: "Название папки",
        );
      },
      child: const Row(
        children: [
          Icon(Icons.mode_edit_outline_outlined, size: 30),
          SizedBox(
            width: 15,
          ),
          Text(
            "Перименовать",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
