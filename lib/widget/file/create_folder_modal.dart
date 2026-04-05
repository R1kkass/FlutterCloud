import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/data/repository/folder_grpc.dart';
import 'package:TalkSpace/gen/dart/folder/folder.pb.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';

class CreateFolderModal extends StatefulWidget {
  const CreateFolderModal({super.key, required this.id});

  final int? id;

  @override
  State<CreateFolderModal> createState() => _CreateFolderModalState();
}

class _CreateFolderModalState extends State<CreateFolderModal> {
  TextEditingController nameFolder = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            await createFolder();
          },
        ),
      ],
    );
  }

  createFolder() async {
    try {
      await _createFolder();
    } catch (e) {
      showUnsuccessToast("Папка не была создана");
    }
  }

  _createFolder() async {
    Navigator.of(context).pop();
    await FolderGrpc().createFolder(
        CreateFolderRequest(name: nameFolder.text, folderId: widget.id));
    showSuccessToast("Папка создана");
    ContentBloc.defaultRequestFile(widget.id, context);
  }
}
