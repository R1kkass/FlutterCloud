import 'dart:io';

import 'package:TalkSpace/domain/model/entities/upload_file_message.dart';
import 'package:TalkSpace/domain/model/enums/file_upload_status.enum.dart';
import 'package:flutter/material.dart';

class ImageFile extends StatelessWidget {
  final File file;
  final UploadFileMessage? uploadFileMessage;

  const ImageFile({
    super.key,
    required this.uploadFileMessage,
    required this.file,
  });

  Widget statusFile() {
    if (uploadFileMessage != null) {
      Widget? widget;
      if (uploadFileMessage!.status == FileUploadStatusEnum.uploading) {
        widget = CircularProgressIndicator(value: uploadFileMessage!.percentUploadFile);
      }
      if (uploadFileMessage!.status == FileUploadStatusEnum.error) {
        widget = Icon(
          Icons.error,
          color: Colors.white,
          size: 40,
        );
      }

      return Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(128),
            shape: BoxShape.circle,
          ),
          child: widget,
        ),
      );
    }

    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        FittedBox(fit: BoxFit.cover, child: Image.file(file)),
        statusFile(),
      ],
    );
  }
}
