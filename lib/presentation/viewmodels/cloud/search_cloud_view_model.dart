import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:flutter/foundation.dart';

class SearchCloudViewModel extends ChangeNotifier {
  CommonCloudData commonCloudData;

  SearchCloudViewModel({
    required this.commonCloudData,
  });

  String searchField = "";

  search(String text, int? folderId) async {
    await commonCloudData.set(search: text, folderId: folderId, page: 1, findEveryWhere: folderId == 0);
    searchField = text;
    notifyListeners();
  }

  clear(int? folderId) async {
    await commonCloudData.set(search: "", folderId: folderId, page: 1, findEveryWhere: folderId == 0);
    searchField = "";
    notifyListeners();
  }
}