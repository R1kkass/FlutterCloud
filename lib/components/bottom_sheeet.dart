import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/folder_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:flutter_application_2/grpc/files_grpc.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class BottomSheetExample extends StatefulWidget {
  final int? id;
  const BottomSheetExample({super.key, required this.id});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExample();
}

class _BottomSheetExample extends State<BottomSheetExample> {
  TextEditingController nameFolder = TextEditingController();
  bool status = false;
  var idFileUpload;
  Future<Response> createFolderApi(context) {
    var id = widget.id;

    id ??= 0;

    return createFolder(FolderParams(nameFolder.text, id), context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void selectFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      Navigator.of(context).pop();

      if (result != null) {
        idFileUpload = DateTime.now().microsecond;
        context.read<FolderCubit>().setUploadFile(
            widget.id,
            FileUpload(
                id: idFileUpload,
                fileName: result.files.single.path!.split("/").last));

        _functionCreate(result);
      } else {
        showToast(context, "Файл не выбран");
      }
    } catch (e) {
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
            return BottomSheet(
                onClosing: () {},
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext cotnext, setState) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ElevatedButton(
                                child: const SizedBox(
                                  height: 50,
                                  child: Column(
                                    children: [
                                      Icon(Icons.create_new_folder_outlined),
                                      Text("Добавить папку")
                                    ],
                                  ),
                                ),
                                onPressed: () => {
                                      Navigator.of(context).pop(),
                                      showDialogBuilder(context),
                                    }),
                            const SizedBox(
                              width: 25,
                            ),
                            ElevatedButton(
                              child: const SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    Icon(Icons.upload_file),
                                    Text("Добавить файл")
                                  ],
                                ),
                              ),
                              onPressed: () => {selectFile()},
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                });
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

  _functionCreate(result) async {
    var box = Hive.box('token');
    var password = box.get("password");
    var folderId = widget.id ?? 0;
    var fileName = result.files.single.path!.split("/").last;

    var filePath = result.files.single.path!;
    if (context.read<FolderCubit>().state.uploadFile[folderId]?[idFileUpload] !=
        null) {
      var argsStream = await Isolate.run(() => FilesGrpc().createStreamArg(
          ArgsForStream(
              file: filePath,
              key: password,
              request:
                  FileUploadRequest(fileName: fileName, folderId: folderId))));
      var callback = FilesGrpc().uploadFile(argsStream);
      context
          .read<FolderCubit>()
          .setCallbackUploadFile(folderId, idFileUpload, callback);
      await callback;
      context.read<FolderCubit>().removeUploadFile(folderId, idFileUpload);
      showToast(context, 'Файл "$fileName" загружен');
    }
  }
}
