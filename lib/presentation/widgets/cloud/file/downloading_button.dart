import 'package:TalkSpace/domain/model/entities/file_download.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/shared/progress_bar.dart';

class DownloadingButton extends StatefulWidget {
  final FileDownload fileDownload;

  const DownloadingButton({
    super.key,
    required this.fileDownload
  });

  @override
  State<DownloadingButton> createState() => _DownloadingButtonState();
}

class _DownloadingButtonState extends State<DownloadingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 5),
      child: Row(
        children: [
          ProgresIndicator(
            value: widget.fileDownload.file.media.size / widget.fileDownload.downloadedSize,
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
            onPressed: () async {
              try {
                await widget.fileDownload.stream.cancel();
              } catch (e) {
                showUnsuccessToast('Не удалось отменить скачивание');
              }
            },
            child: const Text("Отменить")))
        ],
      ),
    );
  }
}
