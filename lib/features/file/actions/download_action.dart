import 'dart:typed_data';

import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/cubit/download_file_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/proto/files/files.pb.dart';
import 'package:TalkSpace/services/encode_file.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadAction {
  void changeState(int id, FileDownloadResponse e, List<int> fileBytes,
      String path, String downloadPath, String fileName, BuildContext context) {
    try {
      if (e.progress >= 100) {
        String key = HiveBoxes.token.get("password")!;
        path = "$downloadPath/$fileName";

        EncodeFile.decryptByte(Uint8List.fromList(fileBytes), path, key);
        context
            .read<DownloadFileBloc>()
            .add(FolderSetStatus(id: id, status: FileDownloadStatus.suceess));
        showToast(context, 'Файл "$fileName" был скачан');
      }
      context
          .read<DownloadFileBloc>()
          .add(FolderSetSizeDownloadFile(id: id, size: e.progress));
    } catch (e) {
      context
          .read<DownloadFileBloc>()
          .add(FolderSetStatus(id: id, status: FileDownloadStatus.reject));
      showToast(context, 'Не удалось скачать файл: $fileName');
    }
  }
}
