import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/download_file_bloc.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_application_2/services/encode_file.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class DownloadAction {
  void changeState(int id, FileDownloadResponse e, List<int> fileBytes,
      String path, String downloadPath, String fileName, BuildContext context) {
    try {
      if (e.progress >= 100) {
        String key = Hive.box("token").get("password");
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
