import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/components/dialog_access.dart';
import 'package:flutter_application_2/entities/folder/dialog_create_folder.dart';
import 'package:flutter_application_2/features/file/file.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/features/file/download_button.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Null showModalFolder(context, FileComponent widget) {
  TextEditingController nameFolder = TextEditingController();
  final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext cotnext, setState) => SizedBox(
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextButton(
                        onPressed: () async {
                          deleteFile(widget.file.id, context).then((e) {
                            e.statusCode == 200
                                ? showToast(context, "Файл удалён")
                                : showToast(
                                    context, "Ошибка при удалении файла");

                            context
                                .read<FolderCubit>()
                                .updateDataFetch(widget.file.folderId, context);
                            Navigator.of(context).pop();
                          }).catchError((e) {
                            showToast(context, "Ошибка при удалении файла");
                          });
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
                      ),
                      DownloadButton(file: widget.file),
                      TextButton(
                        onPressed: () async {
                          showDialogRename(
                              updateFile, widget.file.id.toString(), context,
                              title: "Переименование файла",
                              hintText: "Название файла",
                              successMessage: "Файл переименован",
                              errorMessage: "Файл не переименован",
                              nameFolder: nameFolder);
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
                      ),
                      TextButton(
                        onPressed: () async {
                          showDialogAccess(
                              changeAccessFile,
                              widget.file.id.toString(),
                              args?.id.toString(),
                              context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.mode_edit_outline_outlined, size: 30),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Изменить доступ",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    },
  );
}