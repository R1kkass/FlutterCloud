import 'dart:async';

import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/enums/file_download_status.enum.dart';

class FileDownload {
  FileDownloadStatusEnum status;
  final File file;
  final String path;
  final StreamSubscription<dynamic> stream;
  int downloadedSize;

  FileDownload(
      {required this.file,
        required this.downloadedSize,
        required this.stream,
        required this.path,
        required this.status});
}
