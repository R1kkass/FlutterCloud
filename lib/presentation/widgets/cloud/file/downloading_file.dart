import 'package:TalkSpace/domain/model/entities/file_download.dart';
import 'package:TalkSpace/domain/model/enums/file_download_status.enum.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/error_file.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/shared/progress_bar.dart';

class DownloadingFile extends StatefulWidget {
  final FileDownload fileDownload;
  final int id;
  const DownloadingFile({super.key, required this.fileDownload, required this.id});

  @override
  State<DownloadingFile> createState() => _DownloadingFileState();
}

class _DownloadingFileState extends State<DownloadingFile> {
  @override
  Widget build(BuildContext context) {
    if (widget.fileDownload.status == FileDownloadStatusEnum.downloading) {
      return Row(
        children: [
          ProgresIndicator(
            value: widget.fileDownload.downloadedSize.toDouble(),
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
                widget.fileDownload.stream.cancel();
              },
              child: const Text("Отменить")
            )
          )
        ],
      );
    }

    if (widget.fileDownload.status == FileDownloadStatusEnum.reject) {
      return ErrorFile(
        fileDownload: widget.fileDownload,
        id: widget.id,
      );
    }

    return OpenFileButton(
        path: widget.fileDownload.path, fileName: widget.fileDownload.file.media.fileName);
  }
}
