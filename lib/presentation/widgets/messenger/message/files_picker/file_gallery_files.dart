import 'dart:io';

import 'package:TalkSpace/presentation/viewmodels/messenger/message/file_gallery_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/gallery/gallery_file.dart';
import 'package:TalkSpace/shared/text_button_gallery.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class FileGalleryFiles extends StatefulWidget {
  const FileGalleryFiles({super.key});

  @override
  State<FileGalleryFiles> createState() => _FileGalleryFilesState();
}

class _FileGalleryFilesState extends State<FileGalleryFiles> {
  List<FileSystemEntity> files = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      var permissionStatus = await Permission.storage.status;
      if (!permissionStatus.isGranted) {
        await Permission.storage.request();
      }

      if (!await Permission.photos.status.isGranted) {
        await Permission.photos.request();
      }

      if (!await Permission.videos.status.isGranted) {
        await Permission.videos.request();
      }

      String directory;

      if (Platform.isIOS) {
        directory = (await getApplicationSupportDirectory()).path;
        files = Directory(directory).listSync();
      } else {
        directory = '/storage/emulated/0/Pictures';
        files = Directory(directory).listSync();
        directory = '/storage/emulated/0/DCIM/Camera';
        files = [...files, ...Directory(directory).listSync()];
        directory = '/storage/emulated/0/Movies';
        files = [...files, ...Directory(directory).listSync()];
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FileGalleryViewModel>(builder: (context, viewModel, child) {
      void selectFile() async {
        try {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            allowMultiple: true,
          );

          if (result != null) {
            for (var file in result.files) {
              viewModel.selectFile(file.path!);
            }
          } else {
            showToast("Файл не выбран");
          }
        } catch (e) {
          showToast("Файл не выбран");
        }
      }

      return ListView(
        controller: viewModel.scrollController,
        children: [
          TextButtonGallery(
              action: selectFile,
              icon: Icons.folder,
              color: Colors.deepOrange.shade400,
              text: "Выбрать файлы из хранилища",
              secondaryText: "Поиск в файловой системе",
              child: const SizedBox()),
          if (files.isNotEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                "Недавние файлы",
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
            )
          else
            const Center(child: CircularProgressIndicator()),
          for ( var file in files.reversed)
            if (File(file.path).statSync().type == FileSystemEntityType.file)
              GalleryFile(path: file.path,)
        ],
      );
    });
  }
}
