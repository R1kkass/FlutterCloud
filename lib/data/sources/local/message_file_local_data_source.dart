import 'dart:io';

import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';

class MessageFileLocalDataSource {
  final _downloadedMessageFile = HiveBoxes.chatFileUploaded;

  void addDownloadedFile(MessageFile messageFile, File file) async {
    await _downloadedMessageFile.put("${messageFile.id}${jwtDecode().email}", file.path);
  }

  File? getDownloadedFile(MessageFile messageFile) {
    String? path = _downloadedMessageFile.get("${messageFile.id}${jwtDecode().email}");
    if (path == null) {
      return null;
    }
    return File(path);
  }
}
