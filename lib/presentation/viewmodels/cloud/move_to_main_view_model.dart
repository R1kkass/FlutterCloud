import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/domain/repository/folder_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:TalkSpace/presentation/widgets/cloud/cloud_list.dart';
import 'package:flutter/material.dart';

class MoveToMainViewModel extends ChangeNotifier {
  late FileRepository _fileRepository;
  late FolderRepository _folderRepository;
  late CommonCloudData commonCloudData;

  MoveToMainViewModel({
    required FileRepository fileRepository,
    required FolderRepository folderRepository,
  }) {
    _fileRepository = fileRepository;
    _folderRepository = folderRepository;
  }

  updateCommonCloudData(CommonCloudData commonCloudData) {
    this.commonCloudData = commonCloudData;
  }

  move(DragFields details, int? currentFolderId) async {
    if (details.type == "file") {
      await _fileRepository.moveFile(fileId: details.id, folderToId: 0);
    } else {
      await _folderRepository.moveFolder(folderId: details.id, folderToId: 0);
    }
    await commonCloudData.set(folderId: currentFolderId, findEveryWhere: false, page: 1, search: "");
  }
}
