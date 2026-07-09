import 'dart:async';

import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/entities/file_download.dart';
import 'package:TalkSpace/domain/model/enums/file_download_status.enum.dart';
import 'package:TalkSpace/services/get_download_path.dart';
import 'package:flutter/foundation.dart';

class CommonFileDownload extends ChangeNotifier {
  Map<int, FileDownload> files = {};

  add(File file, StreamSubscription stream) async {
    var downloadPath = await getDownloadPath() ?? "";
    var path = "$downloadPath/${file.media.fileName}";

    files[file.id] = FileDownload(
      downloadedSize: 0,
      file: file,
      path: path,
      status: FileDownloadStatusEnum.downloading,
      stream: stream,
    );
    notifyListeners();
  }

  plusDownloadingFile(File file, int downloadedSize) {
    files[file.id]?.downloadedSize += downloadedSize;
    notifyListeners();
  }

  changeStatus(File file, FileDownloadStatusEnum status) {
    files[file.id]?.status = status;
    notifyListeners();
  }

  clear() async {
    for (var file in files.values) {
      await file.stream.cancel();
    }
    files = {};
    notifyListeners();
  }
}
