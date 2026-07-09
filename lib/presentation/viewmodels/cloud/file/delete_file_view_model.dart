import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:flutter/cupertino.dart';

class DeleteFileViewModel extends ChangeNotifier {
  late FileRepository _fileRepository;
  CommonCloudData commonCloudData;

  DeleteFileViewModel({
    required this.commonCloudData,
    required FileRepository fileRepository,
  }) {
    _fileRepository = fileRepository;
  }

  bool isLoading = false;

  delete(File file) async {
    isLoading = true;
    await _fileRepository.deleteFile(file.id);
    await commonCloudData.set(folderId: file.folderId);
    isLoading = false;
  }
}