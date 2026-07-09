import 'package:TalkSpace/presentation/viewmodels/cloud/file/common_upload_files.dart';
import 'package:flutter/material.dart';

class UploadFileComponentViewModel extends ChangeNotifier {
  CommonUploadFiles commonUploadFiles;

  UploadFileComponentViewModel({
    required this.commonUploadFiles,
  });

  cancel(int id) {
    commonUploadFiles.remove(id);
  }
}
