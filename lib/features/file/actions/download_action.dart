import 'dart:typed_data';

import 'package:TalkSpace/services/get_download_path.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/cubit/download_file_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:TalkSpace/services/encode_file.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';

class DownloadAction {
  final BuildContext context;
  final ResponseStream<FileDownloadResponse> downloadFile;
  final int fileId;
  final String fileName;
  List<int> fileBytes = [];
  String path = "";
  final String _key = HiveBoxes.token.get("password")!;

  DownloadAction(
      {required this.context,
      required this.downloadFile,
      required this.fileId,
      required this.fileName});

  _changeState(FileDownloadResponse e) {
    if (e.progress >= 100) {
      EncodeFile.decryptByteCreateFile(
          Uint8List.fromList(fileBytes), path, _key);
      context
          .read<DownloadFileBloc>()
          .add(FolderSetStatus(id: fileId, status: FileDownloadStatus.suceess));
      showSuccessToast('Файл "$fileName" был скачан');
    }
    context
        .read<DownloadFileBloc>()
        .add(FolderSetSizeDownloadFile(id: fileId, size: e.progress));
  }

  listenDownloadFile() async {
    var downloadPath = await getDownloadPath() ?? "";
    path = "$downloadPath/$fileName";
    downloadFile.listen((downloadResponse) {
      fileBytes = [...fileBytes, ...downloadResponse.chunk];
      _changeState(downloadResponse);
    }).onError((e) {
      context
          .read<DownloadFileBloc>()
          .add(FolderSetStatus(id: fileId, status: FileDownloadStatus.reject));
      showUnsuccessToast('Не удалось скачать файл: $fileName');
    });
  }

  listenReadFile(Function(Uint8List) callback) async {
    downloadFile.listen((downloadResponse) {
      fileBytes = [...fileBytes, ...downloadResponse.chunk];
      if (downloadResponse.progress >= 100) {
        var b =
            EncodeFile.decryptByteReadFile(Uint8List.fromList(fileBytes), _key);
        callback(b);
      }
    });
  }

  cancelDownload() async {
    try {
      await downloadFile.cancel();
      context
          .read<DownloadFileBloc>()
          .add(FolderRemoveDownloadFile(id: fileId));
    } catch (e) {
      showUnsuccessToast('Не удалось отменить скачивание');
    }
  }

  openFile() {}
}
