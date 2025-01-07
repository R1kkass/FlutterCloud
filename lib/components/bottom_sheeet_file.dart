import 'dart:isolate';

import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/widget/file/create_folder_modal.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/proto/files/files.pb.dart';

import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetFile extends StatefulWidget {
  final int? id;
  final ContentState state;
  final BuildContext context;

  const BottomSheetFile(
      {super.key,
      required this.id,
      required this.state,
      required this.context});

  @override
  State<BottomSheetFile> createState() => _BottomSheetFile();
}

class _BottomSheetFile extends State<BottomSheetFile> {
  bool status = false;
  int idFileUpload = 0;

  @override
  void dispose() {
    super.dispose();
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
                              onPressed: selectFile,
                              child: const SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    Icon(Icons.upload_file),
                                    Text("Добавить файл")
                                  ],
                                ),
                              ),
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
        return CreateFolderModal(
          id: widget.id,
        );
      },
    );
  }

  void selectFile() async {
    try {
      await _selectFile();
    } catch (e) {
      print(e);
      _rejectUploadFile();
    }
  }

  _rejectUploadFile() {
    var mainContext =
        NavigationService.navigatorKey.currentContext as BuildContext;
    showToast(mainContext, "Неудалось загрузить файл");
    var folderId = widget.id ?? 0;

    mainContext
        .read<ContentBloc>()
        .add(UploadFileRemove(folderId: folderId, id: idFileUpload));
  }

  _selectFile() async {
    FilePickerResult? selectedFiles = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    Navigator.of(context).pop();

    if (selectedFiles != null) {
      for (var file in selectedFiles.files) {
        idFileUpload = DateTime.now().microsecond;
        context.read<ContentBloc>().add(UploadFileSet(
            id: widget.id,
            data: FileUpload(
                size: 0,
                id: idFileUpload,
                fileName: file.path!.split("/").last)));

        await _uploadFile(file);
      }
    } else {
      showToast(widget.context, "Файл не выбран");
    }
  }

  _uploadFile(PlatformFile result) async {
    var mainContext =
        NavigationService.navigatorKey.currentContext as BuildContext;

    var password = HiveBoxes.token.get("password")!;

    var folderId = widget.id ?? 0;
    var fileName = result.path!.split("/").last;
    var filePath = result.path!;

    var argsStream = await Isolate.run(() => FilesGrpc().createStreamArg(
        ArgsForStream(
            file: filePath,
            key: password,
            request:
                FileUploadRequest(fileName: fileName, folderId: folderId))));
    var fileUploadAdded = mainContext
        .read<ContentBloc>()
        .state
        .uploadFile[folderId]?[idFileUpload];

    if (fileUploadAdded != null) {
      var callback = FilesGrpc().uploadFile(argsStream);

      mainContext.read<ContentBloc>().add(UploadSetCallback(
          id: idFileUpload, folderId: folderId, callback: callback));
      await callback;
      mainContext
          .read<ContentBloc>()
          .add(UploadFileRemove(folderId: folderId, id: idFileUpload));
      ContentBloc.defaultRequestFile(folderId, mainContext);
    }
  }
}
