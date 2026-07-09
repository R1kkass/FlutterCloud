import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/enums/file_download_status.enum.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/download_button_view_model.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/downloading_button.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadButtonViewModel>(builder: (context, viewModel, child) {
      var data = viewModel.commonFileDownload.files[widget.file.id];
      if (data?.status == FileDownloadStatusEnum.downloading) {
        return DownloadingButton(
            fileDownload: data!,
        );
      }
      if (data?.status == FileDownloadStatusEnum.success) {
        return OpenFileButton(
          path: data!.path, fileName: data.file.media.fileName);
      }
      return TextButton(
        onPressed: () => viewModel.downloadFile(widget.file, null),
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
}
