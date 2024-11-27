import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/file_gallery_video_unit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileGalleryImages extends StatefulWidget {
  const FileGalleryImages(
      {super.key,
      required this.selectedFiles,
      required this.scrollController,
      required this.selectFile});

  final Map<String, bool> selectedFiles;
  final ScrollController scrollController;
  final void Function(String) selectFile;

  @override
  State<FileGalleryImages> createState() => _FileGalleryImagesState();
}

class _FileGalleryImagesState extends State<FileGalleryImages> {
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

      String directory;

      if (Platform.isIOS) {
        directory = (await getApplicationSupportDirectory()).path;
      } else {
        directory = '/storage/emulated/0/Pictures';
        files = Directory(directory).listSync();
      }
      if (files.isEmpty) {
        directory = '/storage/emulated/0/DCIM/Camera';
        files = Directory(directory).listSync();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var reImg = RegExp("gif|jpe?g|tiff?|png|webp|bmp");
    var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");
    return GridView.count(
      controller: widget.scrollController,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      crossAxisCount: 3,
      children: [
        for (var file in files.reversed)
          if (reImg.hasMatch(file.path.split("/").last.split(".").last))
            FilegalleryVideoUnit(
              path: file.path,
              selectFile: widget.selectFile,
              selectedFiles: widget.selectedFiles,
            )
          else if (reVideo.hasMatch(file.path.split("/").last.split(".").last))
            AnimatedScale(
              duration: const Duration(milliseconds: 100),
              scale: widget.selectedFiles[file.path] != null ? .9 : 1,
              child: GestureDetector(
                child: FittedBox(
                  // color: Colors.teal[100],
                  fit: BoxFit.fill,
                  child: Image.file(File(file.path)),
                ),
                onTap: () {
                  widget.selectFile(file.path);
                },
              ),
            )
      ],
    );
  }
}
