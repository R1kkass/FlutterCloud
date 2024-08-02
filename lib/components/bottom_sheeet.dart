import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/api/folder_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_2/components/toast.dart';

import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class BottomSheetExample extends StatefulWidget {
  final String? id;
  const BottomSheetExample({super.key, required this.id});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExample();
}

class _BottomSheetExample extends State<BottomSheetExample> {
  TextEditingController nameFolder = TextEditingController();

  Future<Response> createFolderApi(context) {
    var id = widget.id;

    id ??= "";

    return createFolder(FolderParams(nameFolder.text, id), context);
  }

  void selectFile() async {
    var id = widget.id;

    id ??= "";
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    Navigator.of(context).pop();

    if (result != null) {
      File file = File(result.files.single.path!);
      createFile(
          FileParams(id, file.readAsBytesSync(), file.path.split("/").last),
          context, (e) {
        e.statusCode == 201
            ? showToast(context, "Файл создан")
            : showToast(context, "Файл не был создан");
      });
    } else {
      showToast(context, "Файл не выбран");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('Создать'),
      icon: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                        child: const Icon(Icons.create_new_folder_outlined),
                        onPressed: () => {
                              Navigator.of(context).pop(),
                              showDialogBuilder(context),
                            }),
                    ElevatedButton(
                      child: const Icon(Icons.upload_file),
                      onPressed: () => {selectFile()},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Null showDialogBuilder(context) {
    showDialog<void>(
      context: context,
      builder: (context) {
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
                context.read<FolderCubit>().updateDataFetch(widget.id, context);
              },
            ),
          ],
        );
      },
    );
  }
}