import 'dart:io';

import 'package:TalkSpace/domain/model/enums/file_upload_status.enum.dart';

class UploadFileMessage {
  double percentUploadFile;
  FileUploadStatusEnum status;
  final File file;
  Function()? repeat;

  UploadFileMessage({
    required this.file,
    this.repeat,
    this.percentUploadFile = 0,
    this.status = FileUploadStatusEnum.uploading
  });
}
