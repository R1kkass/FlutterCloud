import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/file/downloading_button.dart';
import 'package:flutter_application_2/entities/file/open_file.dart';
import 'package:flutter_application_2/grpc/files_grpc.dart';
import 'package:flutter_application_2/pages/get_download_path.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:flutter_application_2/services/encode_file.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

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
  double value = 0.0;
  int download = 0;
  String path = "";
  bool success = false;
  List<int> fileBytes = [];
  ResponseStream<FileDownloadResponse>? downloadFile;

  @override
  Widget build(BuildContext context) {
    if (download == 1) {
      return DownloadingButton(value: value, fn: _cancelDownload);
    }
    if (download == 2) {
      return OpenFileButton(path: path);
    }
    if (download == 3) {
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
  }

  void _downloadFile() async {
    var downloadPath = await getDownloadPath();

    void changeState(FileDownloadResponse e) async {
      try {
        setState(() {
          value = e.progress;
          if (value >= 100) {
            String key = Hive.box("token").get("password");
            path = "$downloadPath/${widget.file.fileName}";
            EncodeFile.decryptByte(Uint8List.fromList(fileBytes), path, key);
            download = 2;
          }
        });
      } catch (e) {
        setState(() {
          download = 3;
        });
      }
    }

    downloadFile = FilesGrpc().downloadFile(
      FileDownloadRequest(
        fileId: widget.file.id,
        folderId: widget.file.folderId,
      ),
    );
    downloadFile!.listen((e) {
      fileBytes = [...fileBytes, ...e.chunk];
      changeState(e);
    });
    setState(() {
      download = 1;
    });
  }

  void _cancelDownload() {
    downloadFile!.cancel();
    setState(() {
      download = 0;
      value = 0.0;
    });
  }
}
