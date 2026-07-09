import 'package:TalkSpace/domain/model/request/file/find_file_request.dart';
import 'package:TalkSpace/domain/model/response/file/find_cloud_response.dart';
import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:flutter/foundation.dart';

class CommonCloudData extends ChangeNotifier {
  late FileRepository _fileRepository;

  CommonCloudData({
    required FileRepository fileRepository,
  }) {
    _fileRepository = fileRepository;
  }

  FindCloudResponse data = FindCloudResponse(files: [], folders: []);

  set({
    int? folderId = 0,
    String search = "",
    bool findEveryWhere = false,
    int page = 1,
  }) async {
    data = await _fileRepository.findFile(FindFileRequest(folderId: folderId, search: search, findEveryWhere: findEveryWhere, page: page));
    notifyListeners();
  }
}
