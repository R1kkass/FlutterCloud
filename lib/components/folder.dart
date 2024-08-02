import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/api/folder_api.dart';
import 'package:flutter_application_2/components/dialog_access.dart';
import 'package:flutter_application_2/components/dialog_create_folder.dart';
import 'package:flutter_application_2/components/text_content.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/futureBuilders/folder_builder.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/components/toast.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GeneralFields {
  final List<Folder?> folders;
  final List<File?> files;

  GeneralFields(this.folders, this.files);
}

class FolderComponent extends StatefulWidget {
  final Folder folder;
  const FolderComponent({super.key, required this.folder});

  @override
  State<FolderComponent> createState() => _FolderState();
}

class _FolderState extends State<FolderComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: DragTarget<DragFields>(
        builder: (context, candidateItems, rejectedItems) {
          return TextButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    candidateItems.isNotEmpty
                        ? Colors.deepOrange.shade100
                        : Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, '/',
                  arguments: HomeArgs(
                      widget.folder.id.toString(), widget.folder.nameFolder));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.folder_outlined, size: 27),
                    const SizedBox(width: 10),
                    TextContent(text: widget.folder.nameFolder)
                  ],
                ),
                const SizedBox(width: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        showModalFolder();
                      },
                      child: const Icon(Icons.more_vert, size: 20)),
                ),
              ],
            ),
          );
        },
        onWillAcceptWithDetails: (details) {
          if (details.data.type == "file") return true;
          return details.data.id != widget.folder.id.toString();
        },
        onAcceptWithDetails: (details) {
          if (details.data.type == "file") {
            moveFile(details.data.id.toString(), widget.folder.id.toString(),
                    context)
                .then((e) {
              context
                  .read<FolderCubit>()
                  .updateDataFetch(widget.folder.folderId.toString(), context);
            });
          } else {
            moveFolder(details.data.id, widget.folder.id.toString(), context)
                .then((e) {
              context
                  .read<FolderCubit>()
                  .updateDataFetch(widget.folder.folderId.toString(), context);
              e.statusCode == 200
                  ? showToast(context, "Папка перемещена")
                  : showToast(context, "Папка не перемещена");
            });
          }
        },
      ),
    );
  }

  Null showModalFolder() {
    TextEditingController nameFolder = TextEditingController();

    showModalBottomSheet<void>(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<FolderCubit>(context),
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      deleteFolder(widget.folder.id, context).then((e) {
                        if (e.statusCode == 201) {
                          showToast(context, "Папка удалена");
                        } else {
                          showToast(context, "Ошибка при удалении папки");
                        }
                        context
                            .read<FolderCubit>()
                            .updateDataFetch(widget.folder.folderId.toString(), context);
                        Navigator.of(context).pop();
                      }).catchError((e) {
                        showToast(context, "Ошибка при удалении папки");
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
                      showDialogRename(
                          updateFolder, widget.folder.id.toString(), context,
                          title: "Переименование папки",
                          hintText: "Название папки",
                          successMessage: "Папка переименована",
                          errorMessage: "Папка не переименована",
                          nameFolder: nameFolder);
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
                  ),
                  TextButton(
                    onPressed: () async {
                      showDialogAccess(changeAccessFolder, null,
                          widget.folder.id.toString(), context);
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
      },
    );
  }
}
