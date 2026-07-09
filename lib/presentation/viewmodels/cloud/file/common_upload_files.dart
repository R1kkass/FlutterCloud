import 'package:TalkSpace/domain/model/entities/upload_file.dart';
import 'package:flutter/foundation.dart';

class CommonUploadFiles extends ChangeNotifier {
  Map<int, UploadFile> uploadFiles = {};

  add(int id, UploadFile uploadFile) {
    uploadFiles[id] = uploadFile;
    notifyListeners();
  }

  remove(int id) {
    uploadFiles.remove(id);
    notifyListeners();
  }
}
