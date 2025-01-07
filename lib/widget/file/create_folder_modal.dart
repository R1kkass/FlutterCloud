import 'package:TalkSpace/api/folder_api.dart';
import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
            Navigator.of(context).pop();

            await createFolderApi(context).then((e) {
              e.statusCode == 201
                  ? showToast(context, "Папка создана")
                  : showToast(context, "Папка не была создана");
            }).catchError((e) {
              showToast(context, "Папка не была создана");
            });
            ContentBloc.defaultRequestFile(widget.id, context);
          },
        ),
      ],
    );
  }

    Future<Response> createFolderApi(context) {
    var id = widget.id;

    id ??= 0;

    return createFolder(FolderParams(nameFolder.text, id), context);
  }
}
