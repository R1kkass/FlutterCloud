import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/common_file_download.dart';
import 'package:flutter/material.dart';

class CloudListViewModel extends ChangeNotifier {
  late CommonCloudData commonCloudData;
  late CommonFileDownload commonFileDownload;

  CloudListViewModel() {
    scrollController.addListener(_scrollListener);
  }

  updateProperty({
    required commonCloudData,
    required commonFileDownload
  }) {
    this.commonCloudData = commonCloudData;
    this.commonFileDownload = commonFileDownload;
  }

  bool isError = false;
  bool isLoading = false;
  bool dragStart = false;
  int page = 1;
  late int? folderId;

  final ScrollController scrollController = ScrollController();
  final _scrollThreshold = 1.00;

  getFiles(int? folderId) async {
    try {
      isLoading = true;
      notifyListeners();
      await commonCloudData.set(folderId: folderId);
    } catch (e) {
      isError = true;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  setIsDrag(bool value) {
    dragStart = value;
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() async {
    if (scrollController.offset >=
        scrollController.position.maxScrollExtent * _scrollThreshold &&
        !scrollController.position.outOfRange) {
      page++;
      await commonCloudData.set(folderId: folderId, page: page);
    }
  }
}