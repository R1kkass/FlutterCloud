import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/download_file_bloc.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/entities/file/error_file.dart';
import 'package:flutter_application_2/entities/file/open_file.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/shared/progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadingFile extends StatefulWidget {
  final FileDownload file;
  final int id;
  const DownloadingFile({super.key, required this.file, required this.id});

  @override
  State<DownloadingFile> createState() => _DownloadingFileState();
}

class _DownloadingFileState extends State<DownloadingFile> {
  var mainContext =
      NavigationService.navigatorKey.currentContext as BuildContext;

  @override
  Widget build(BuildContext context) {
    if (widget.file.status == FileDownloadStatus.downloading) {
      return Row(
        children: [
          ProgresIndicator(
            value: widget.file.size,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Скачивание...",
            style: TextStyle(
                fontSize: 16,
                color: Colors.deepOrange.shade800,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          SizedBox(
              child: TextButton(
                  onPressed: () {
                    widget.file.callback!.cancel();
                    context
                        .read<DownloadFileBloc>()
                        .add(FolderRemoveDownloadFile(id: widget.id));
                  },
                  child: const Text("Отменить")))
        ],
      );
    }

    if (widget.file.status == FileDownloadStatus.reject) {
      return ErrorFile(
        file: widget.file,
        id: widget.id,
      );
    }

    return OpenFileButton(
        path: widget.file.path, fileName: widget.file.fileName);
  }
}
