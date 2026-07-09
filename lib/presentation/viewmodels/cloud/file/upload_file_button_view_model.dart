import 'dart:isolate';

import 'package:TalkSpace/domain/model/entities/upload_file.dart';
import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/common_upload_files.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class UploadFileButtonViewModel extends ChangeNotifier {
  CommonUploadFiles commonUploadFiles;
  CommonCloudData commonCloudData;
  late FileRepository _fileRepository;

  UploadFileButtonViewModel({
    required this.commonUploadFiles,
    required this.commonCloudData,
    required FileRepository fileRepository
  }) {
    _fileRepository = fileRepository;
  }

  int idFileUpload = 0;

  Future<bool> selectFile(int? folderId) async {
    try {
      FilePickerResult? selectedFiles = await FilePicker.platform.pickFiles(
        allowMultiple: true,
      );

      if (selectedFiles != null) {
        for (var file in selectedFiles.files) {
          idFileUpload = DateTime
              .now()
              .microsecond;
          notifyListeners();

          commonUploadFiles.add(idFileUpload, UploadFile(id: idFileUpload, fileName: file.name, size: file.size));
          await _uploadFile(folderId, file);
        }
      }
      return selectedFiles != null;
    } catch (e) {
      rethrow;
    } finally {
      commonUploadFiles.remove(idFileUpload);
    }

  }

  _uploadFile(int? folderId, PlatformFile file) async {
    var argsStream = await Isolate.run(() => _fileRepository.createStreamArg(
        ArgsForStream(
          file: file,
          folderId: folderId,
        )
    ));

    if (commonUploadFiles.uploadFiles[idFileUpload] != null) {
      await _fileRepository.uploadFile(argsStream);

      await commonCloudData.set(folderId: folderId);
    }
  }
}
