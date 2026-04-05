import 'dart:isolate';

import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/data/repository/files_grpc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadFileButton extends StatefulWidget {
  final int? id;

  const UploadFileButton({super.key, required this.id});

  @override
  State<UploadFileButton> createState() => _UploadFileButtonState();
}

class _UploadFileButtonState extends State<UploadFileButton> {
  int idFileUpload = 0;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: selectFile,
      child: const SizedBox(
        height: 50,
        child: Column(
          children: [Icon(Icons.upload_file), Text("Добавить файл")],
        ),
      ),
    );
  }

  void selectFile() async {
    try {
      await _selectFile();
    } catch (e) {
      _rejectUploadFile();
    }
  }

  _rejectUploadFile() {
    var mainContext =
        NavigationService.navigatorKey.currentContext as BuildContext;
    showUnsuccessToast("Не удалось загрузить файл");
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
      showToast("Файл не выбран");
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
      var callback = await FilesGrpc().uploadFile(argsStream);

      mainContext.read<ContentBloc>().add(UploadSetCallback(
          id: idFileUpload, folderId: folderId, callback: callback));
      mainContext
          .read<ContentBloc>()
          .add(UploadFileRemove(folderId: folderId, id: idFileUpload));
      ContentBloc.defaultRequestFile(folderId, mainContext);
    }
  }
}
