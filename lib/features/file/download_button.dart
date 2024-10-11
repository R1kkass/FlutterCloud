import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/download_file_bloc.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/entities/file/downloading_button.dart';
import 'package:flutter_application_2/entities/file/open_file.dart';
import 'package:flutter_application_2/features/file/actions/download_action.dart';
import 'package:flutter_application_2/grpc/files_grpc.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/services/get_download_path.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:grpc/grpc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadButton extends StatefulWidget {
  final FileFind file;
  const DownloadButton({super.key, required this.file});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

final downloadStatus = {
  "0": "Ожидание",
  "1": "Скачивание",
  "2": "Успех",
  "3": "Неудача"
};

class _DownloadButtonState extends State<DownloadButton> {
  String path = "";
  bool success = false;
  List<int> fileBytes = [];
  ResponseStream<FileDownloadResponse>? downloadFile;
  var mainContext =
      NavigationService.navigatorKey.currentContext as BuildContext;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadFileBloc, DownloadFileState>(
        builder: (context, state) {
      var data = state.downloadFile[widget.file.id];
      if (data?.status == FileDownloadStatus.downloading) {
        return DownloadingButton(value: data?.size ?? 0, fn: _cancelDownload);
      }
      if (data?.status == FileDownloadStatus.suceess) {
        return OpenFileButton(
            path: path, fileName: data?.fileName ?? widget.file.fileName);
      }
      if (data?.status == FileDownloadStatus.reject) {
        return Container(child: const Text("Ошибка"));
      }
      return TextButton(
        onPressed: _downloadFile,
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
      );
    });
  }

  void _downloadFile() async {
    Navigator.of(context).pop();
    var downloadPath = await getDownloadPath() ?? "";

    downloadFile = FilesGrpc().downloadFile(
      FileDownloadRequest(
        fileId: widget.file.id,
        folderId: widget.file.folderId,
      ),
    );
    mainContext.read<DownloadFileBloc>().add(FolderDownloadFile(
        downloadFile: FileDownload(
            folderId: widget.file.folderId,
            path: path,
            callback: downloadFile,
            fileName: widget.file.fileName,
            size: 0.0,
            status: FileDownloadStatus.downloading),
        id: widget.file.id));

    downloadFile!.listen((e) {
      // if (mainContext.read<FolderCubit>().state.downloadFile[widget.file.id] !=
      //     null) {
      fileBytes = [...fileBytes, ...e.chunk];
      DownloadAction().changeState(widget.file.id, e, fileBytes, path,
          downloadPath, widget.file.fileName, mainContext);
      // }
    }).onError((e) {
      mainContext.read<DownloadFileBloc>().add(FolderSetStatus(
          id: widget.file.id, status: FileDownloadStatus.reject));
      showToast(
          mainContext, 'Не удалось скачать файл: ${widget.file.fileName}');
    });
  }

  void _cancelDownload() {
    downloadFile!.cancel();
    mainContext
        .read<DownloadFileBloc>()
        .add(FolderRemoveDownloadFile(id: widget.file.id));
  }
}
