import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/folder/delete_folder_button_view_model.dart';
import 'package:TalkSpace/presentation/views/cloud.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteFolderButton extends StatefulWidget {
  const DeleteFolderButton({super.key, required this.folder, required this.currentRouteFolderId});

  final Folder folder;
  final int? currentRouteFolderId;

  @override
  State<DeleteFolderButton> createState() => _DeleteFolderButtonState();
}

class _DeleteFolderButtonState extends State<DeleteFolderButton> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CloudArgs;
    return Consumer<DeleteFolderButtonViewModel>(builder: (context, viewModel, child) {
      delete() async {
        try {
          await viewModel.deleteFolder(currentFolderId: args.folder?.id, folderId: widget.folder.id);
          showSuccessToast("Папка удалена");
          Navigator.of(context).pop();
        } catch (e) {
          showUnsuccessToast("Ошибка при удалении папки");
        }
      }

      return TextButton(
        onPressed: () async {
          await delete();
        },
        child: const Row(
          children: [
            Icon(Icons.delete_outline, size: 30),
            SizedBox(
              width: 15,
            ),
            Text(
              "Удалить",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      );
    });
  }
}
