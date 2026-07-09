import 'dart:io';

import 'package:TalkSpace/presentation/viewmodels/messenger/message/index.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/tab_file_picker_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileGalleryViewModel extends ChangeNotifier {
  late UploadFileViewModel uploadFileViewModel;

  updateUploadFileViewModel(UploadFileViewModel uploadFileViewModel) {
    this.uploadFileViewModel = uploadFileViewModel;
  }

  List<FileSystemEntity> files = [];
  Map<String, bool> selectedFiles = {};
  final ScrollController scrollController = ScrollController();
  bool sizeModal = false;
  double messageInputHeight = 0;
  bool inputFocused = false;
  final KeyboardHeightPlugin keyboardHeightPlugin = KeyboardHeightPlugin();

  initGallery() async {
    try {
      files = [];
      var permissionStatus = await Permission.storage.status;
      if (permissionStatus.isDenied) {
        await Permission.storage.request();
      }

      if (await Permission.photos.status.isDenied) {
        await Permission.photos.request();
      }

      if (await Permission.videos.status.isDenied) {
        await Permission.videos.request();
      }

      String directory;

      if (Platform.isIOS) {
        directory = (await getApplicationSupportDirectory()).path;
        files = Directory(directory).listSync();
      } else {
        directory = '/storage/emulated/0/Pictures';
        files = Directory(directory).listSync();
        directory = '/storage/emulated/0/Movies';
        files = [...files, ...Directory(directory).listSync()];
        // directory = '/storage/emulated/0/Camera';
        // files = [...files, ...Directory(directory).listSync()];
      }
    } finally {
      notifyListeners();
    }
  }
  
  int get count => selectedFiles.length;

  selectFile(String path) {
    if (selectedFiles[path] == null && count < 10) {
      selectedFiles[path] = true;
    } else {
      selectedFiles.remove(path);
    }
    setMessageInputHeight();
    notifyListeners();
  }

  setMessageInputHeight() {
    if (count != 0 && !inputFocused) {
      messageInputHeight = 60;
      return;
    }
    if (count == 0) {
      messageInputHeight = 0;
    }
    notifyListeners();
  }

  TabFilePickerEnum selectedTabFilePicker = TabFilePickerEnum.gallery;

  setCurrentFileType(TabFilePickerEnum type) {
    selectedTabFilePicker = type;
    notifyListeners();
  }

  int? getIndex(String path) {
    return selectedFiles[path] != null
        ? selectedFiles.keys.toList().indexOf(path) + 1
        : null;
  }

  void clearSelectedFiles() {
    selectedFiles = {};
    notifyListeners();
  }
}
