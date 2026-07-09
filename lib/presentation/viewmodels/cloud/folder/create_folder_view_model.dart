import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/domain/repository/folder_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:flutter/foundation.dart';

class CreateFolderViewModel extends ChangeNotifier {
  late FolderRepository _folderRepository;
  late CommonCloudData commonCloudData;

  CreateFolderViewModel({
    required FileRepository fileRepository,
    required FolderRepository folderRepository,
  }) {
    _folderRepository = folderRepository;
  }

  create({
    required String name,
    required int? folderId
  }) async {
    await _folderRepository.createFolder(name: name, folderId: folderId);
    await commonCloudData.set(folderId: folderId);
  }

  updateCommonCloudData(CommonCloudData commonCloudData) {
    this.commonCloudData = commonCloudData;
  }
}