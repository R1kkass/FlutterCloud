import 'package:TalkSpace/domain/repository/folder_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:flutter/foundation.dart';

class DeleteFolderButtonViewModel extends ChangeNotifier {
  CommonCloudData commonCloudData;
  late FolderRepository _folderRepository;

  DeleteFolderButtonViewModel({
    required this.commonCloudData,
    required FolderRepository folderRepository,
  }) {
    _folderRepository = folderRepository;
  }

  deleteFolder({required int? currentFolderId, required int folderId}) async {
    await _folderRepository.deleteFolder(folderId);
    await commonCloudData.set(folderId: currentFolderId);
  }
}
