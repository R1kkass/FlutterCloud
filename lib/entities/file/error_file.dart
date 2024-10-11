import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/download_file_bloc.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/grpc/files_grpc.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/services/get_download_path.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_application_2/services/encode_file.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorFile extends StatefulWidget {
  final FileDownload file;
  final int id;

  const ErrorFile({super.key, required this.file, required this.id});

  @override
  State<ErrorFile> createState() => _ErrorFileState();
}

class _ErrorFileState extends State<ErrorFile> {
  var mainContext =
      NavigationService.navigatorKey.currentContext as BuildContext;
  String path = "";
  List<int> fileBytes = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          const Icon(Icons.error, size: 25),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              'Ошибка скачивания файла "${widget.file.fileName}"',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepOrange.shade800,
                  fontWeight: FontWeight.w500),
            ),
          ),
          TextButton(
            child: const Text(
              "Повторить",
            ),
            onPressed: () {
              _downloadFile();
            },
          )
        ],
      ),
    );
  }

  void _downloadFile() async {
    var downloadPath = await getDownloadPath();

    void changeState(FileDownloadResponse e) async {
      try {
        if (e.progress >= 100) {
          String key = Hive.box("token").get("password");
          path = "$downloadPath/${widget.file.fileName}";
          EncodeFile.decryptByte(Uint8List.fromList(fileBytes), path, key);
          mainContext.read<DownloadFileBloc>().add(FolderSetStatus(
              id: widget.id, status: FileDownloadStatus.suceess));
          showToast(context, 'Файл "${widget.file.fileName}" был скачан');
          return;
        }
        mainContext
            .read<DownloadFileBloc>()
            .add(FolderSetSizeDownloadFile(id: widget.id, size: e.progress));
      } catch (e) {
        mainContext.read<DownloadFileBloc>().add(
            FolderSetStatus(id: widget.id, status: FileDownloadStatus.reject));
        showToast(context, 'Не удалось скачать файл: ${widget.file.fileName}');
      }
    }

    var downloadFile = FilesGrpc().downloadFile(
      FileDownloadRequest(
        fileId: widget.id,
        folderId: widget.file.folderId,
      ),
    );
    mainContext.read<DownloadFileBloc>().add(
        FolderSetStatus(status: FileDownloadStatus.downloading, id: widget.id));
    mainContext
        .read<DownloadFileBloc>()
        .add(FolderSetCallback(callback: downloadFile, id: widget.id));
    downloadFile.listen((e) {
      if (mainContext.read<FolderCubit>().state.downloadFile[widget.id] !=
          null) {
        fileBytes = [...fileBytes, ...e.chunk];
        changeState(e);
      }
    }).onError((e) {
      mainContext.read<DownloadFileBloc>().add(
          FolderSetStatus(id: widget.id, status: FileDownloadStatus.reject));
      showToast(
          mainContext, 'Не удалось скачать файл: ${widget.file.fileName}');
    });
  }
}
