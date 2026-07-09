import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/request/file/index.dart';
import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:flutter/foundation.dart';

class RenameFileViewModel extends ChangeNotifier {
  late FileRepository _fileRepository;
  CommonCloudData commonCloudData;

  RenameFileViewModel({
    required FileRepository fileRepository,
    required this.commonCloudData,
  }) {
    _fileRepository = fileRepository;
  }

  rename(File file, String name) async {
    await _fileRepository.renameFile(RenameFileRequest(folderId: file.folderId, fileId: file.id, name: name));
    commonCloudData.set(folderId: file.folderId);
  }
}
