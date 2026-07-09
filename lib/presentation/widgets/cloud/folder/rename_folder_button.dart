import 'package:TalkSpace/presentation/viewmodels/cloud/folder/index.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/dialog_rename.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RenameFolderButton extends StatefulWidget {
  const RenameFolderButton({super.key, required this.folderId, required this.currentRouteFolderId});

  final int folderId;
  final int? currentRouteFolderId;

  @override
  State<RenameFolderButton> createState() => _RenameFolderButtonState();
}

class _RenameFolderButtonState extends State<RenameFolderButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RenameFolderButtonViewModel>(builder: (context, viewModel, child) {
      rename(String name) async {
        try {
          await viewModel.rename(name: name, folderId: widget.folderId, currentFolderId: widget.currentRouteFolderId);
          showSuccessToast("Папка переименована");
        } catch (e) {
          showUnsuccessToast("Не удалось переименовать папку");
        }
      }
      return TextButton(
        onPressed: () async {
          showDialogRename(
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
    });
  }
}
