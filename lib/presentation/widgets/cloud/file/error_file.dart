import 'package:TalkSpace/domain/model/entities/file_download.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/download_button_view_model.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:provider/provider.dart';

class ErrorFile extends StatefulWidget {
  final FileDownload fileDownload;
  final int id;

  const ErrorFile({super.key, required this.fileDownload, required this.id});

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
    return Consumer<DownloadButtonViewModel>(builder: (context, viewModel, child) {
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
                'Ошибка скачивания файла "${widget.fileDownload.file.media.fileName}"',
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
              onPressed: () async {
                try {
                  await viewModel.downloadFile(widget.fileDownload.file, null);
                  showSuccessToast('Файл "${widget.fileDownload.file.media.fileName}" был скачан');
                } catch (e) {
                  showUnsuccessToast('Не удалось скачать файл: ${widget.fileDownload.file.media.fileName}');
                }
              },
            )
          ],
        ),
      );
    });
  }
}
