import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/cubit/download_file_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/presentation/widgets/file/downloading_button.dart';
import 'package:TalkSpace/presentation/widgets/file/open_file.dart';
import 'package:TalkSpace/features/file/actions/download_action.dart';
import 'package:TalkSpace/data/repository/files_grpc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/services/get_download_path.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadButton extends StatefulWidget {
  final File file;
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
  DownloadAction? downloadAction;
  String path = "";
  bool success = false;
  var mainContext =
      NavigationService.navigatorKey.currentContext as BuildContext;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadFileBloc, DownloadFileState>(
        builder: (context, state) {
      var data = state.downloadFile[widget.file.id];
      if (data?.status == FileDownloadStatus.downloading) {
        return DownloadingButton(
            value: data?.size ?? 0,
            fn: () async {
              await cancelDownload();
            });
      }
      if (data?.status == FileDownloadStatus.suceess) {
        return OpenFileButton(
            path: path, fileName: data?.fileName ?? widget.file.media.fileName);
      }
      return TextButton(
        onPressed: downloadFile,
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

  downloadFile() async {
    try {
      await _downloadFile();
    } catch (e) {
      showUnsuccessToast("Не удалось скачать файл");
    }
  }

  _downloadFile() async {
    Navigator.of(context).pop();
    var downloadPath = await getDownloadPath() ?? "";
    path = "$downloadPath/${widget.file.media.fileName}";

    downloadAction = DownloadAction(
      context: mainContext,
      fileName: widget.file.media.fileName,
      fileId: widget.file.id,
      folderId: widget.file.folderId,
    );
    await downloadAction!.listenDownloadFile();

    mainContext.read<DownloadFileBloc>().add(FolderDownloadFile(
        downloadFile: FileDownload(
            folderId: widget.file.folderId,
            path: path,
            callback: downloadAction?.downloadFile,
            fileName: widget.file.media.fileName,
            size: 0.0,
            status: FileDownloadStatus.downloading),
        id: widget.file.id));
  }

  cancelDownload() async {
    try {
      await downloadAction!.cancelDownload();
    } catch (e) {
      showUnsuccessToast('Не удалось отменить скачивание');
    }
  }
}
