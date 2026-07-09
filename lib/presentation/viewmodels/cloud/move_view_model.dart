import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/domain/repository/folder_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:flutter/foundation.dart';

class MoveViewModel extends ChangeNotifier {
  late FolderRepository _folderRepository;
  late FileRepository _fileRepository;
  CommonCloudData commonCloudData;

  MoveViewModel({
    required this.commonCloudData,
    required FolderRepository folderRepository,
    required FileRepository fileRepository,
  }) {
    _folderRepository = folderRepository;
    _fileRepository = fileRepository;
  }

  moveFolder({
    required int folderId,
    required int folderToId,
    required int? currentFolderId
  }) async {
    await _folderRepository.moveFolder(folderId: folderId, folderToId: folderToId);
    await commonCloudData.set(folderId:  currentFolderId);
  }

  moveFile({
    required int fileId,
    required int folderToId,
    required int? currentFolderId
  }) async {
    await _fileRepository.moveFile(fileId: fileId, folderToId: folderToId);
    await commonCloudData.set(folderId:  currentFolderId);
  }
}
