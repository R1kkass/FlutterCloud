import 'package:TalkSpace/domain/repository/folder_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:flutter/foundation.dart';

class RenameFolderButtonViewModel extends ChangeNotifier {
  late FolderRepository _folderRepository;
  CommonCloudData commonCloudData;

  RenameFolderButtonViewModel({
    required this.commonCloudData,
    required FolderRepository folderRepository,
  }) {
    _folderRepository = folderRepository;
  }

  rename({
    required String name,
    required int folderId,
    required int? currentFolderId,
  }) async {
    await _folderRepository.renameFolder(name: name, folderId: folderId);
    await commonCloudData.set(folderId: currentFolderId);
  }
}

