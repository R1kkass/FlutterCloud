import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/components/dialog_access.dart';
import 'package:flutter_application_2/components/dialog_create_folder.dart';
import 'package:flutter_application_2/components/dialog_loading.dart';
import 'package:flutter_application_2/components/text_content.dart';
import 'package:flutter_application_2/components/toast.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/open_file.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:flutter_application_2/services/file_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileComponent extends StatefulWidget {
  final File file;
  const FileComponent({super.key, required this.file});

  @override
  State<FileComponent> createState() => _FileComponentState();
}

class _FileComponentState extends State<FileComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, FILE,
              arguments: OpenFileArgs(file: widget.file));
        },
        style:
            ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.insert_drive_file_outlined, size: 27),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContent(text: widget.file.fileName),
                    Text(
                      fileSize(widget.file.size.toInt()),
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    showModalFolder(context);
                  },
                  child: const Icon(Icons.more_vert, size: 20)),
            )
          ],
        ),
      ),
    );
  }

  Null showModalFolder(context) {
    TextEditingController nameFolder = TextEditingController();
    final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
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
                          : showToast(context, "Ошибка при удалении файла");

                      context.read<FolderCubit>().updateDataFetch(
                          widget.file.folderId.toString(), context);
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
                TextButton(
                  onPressed: () async {
                    showLoaderDialog(context);

                    await downloadFile(
                      widget.file.id.toString(),
                      widget.file.fileName,
                      context,
                    ).then((e) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      showToast(context, "Файл успешно скачен");
                    }).catchError((e) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      showToast(context, "Файл не был скачен");
                    });
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.download_outlined, size: 30),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Скачать",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
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
                    showDialogAccess(changeAccessFile,
                        widget.file.id.toString(), args?.id, context);
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
        );
      },
    );
  }
}
