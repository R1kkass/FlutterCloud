import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/folder/create_folder_view_model.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateFolderModal extends StatefulWidget {
  const CreateFolderModal({super.key, required this.folder});

  final Folder? folder;

  @override
  State<CreateFolderModal> createState() => _CreateFolderModalState();
}

class _CreateFolderModalState extends State<CreateFolderModal> {
  TextEditingController nameFolder = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateFolderViewModel>(builder: (context, viewModel, child) {
      return AlertDialog(
        title: const Text('Название папки'),
        content: TextField(
          controller: nameFolder,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintText: 'Новая папка'),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Отмена'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Создать'),
            onPressed: () async {
              try {
                await viewModel.create(name: nameFolder.text, folderId: widget.folder?.id);
              } catch (e) {
                showUnsuccessToast("Папка не была создана");
              }
            },
          ),
        ],
      );
    });
  }
}
