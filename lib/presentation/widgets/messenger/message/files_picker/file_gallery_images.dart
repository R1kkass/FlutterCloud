import 'dart:io';

import 'package:TalkSpace/presentation/viewmodels/messenger/message/file_gallery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/file_gallery_image_unit.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/file_gallery_video_unit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class FileGalleryImages extends StatefulWidget {
  const FileGalleryImages({super.key});

  @override
  State<FileGalleryImages> createState() => FileGalleryImagesState();
}

class FileGalleryImagesState extends State<FileGalleryImages> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      await Provider.of<FileGalleryViewModel>(context, listen: false).initGallery();
    });
  }

  @override
  Widget build(BuildContext context) {
    var reImg = RegExp("gif|jpe?g|tiff?|png|webp|bmp");
    var reVideo = RegExp("mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*");
    return Consumer<FileGalleryViewModel>(
      builder: (context, viewModel, child) {
        return GridView.count(
          controller: viewModel.scrollController,
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          crossAxisCount: 3,
          children: [
            for (var file in viewModel.files.reversed)
              if (reImg.hasMatch(file.path.split(Platform.pathSeparator).last.split(".").last))
                FileGalleryImageUnit(
                  path: file.path,
                )
              else if (reVideo.hasMatch(file.path.split(Platform.pathSeparator).last.split(".").last))
                FileGalleryVideoUnit(
                  path: file.path,
                )
          ],
        );
      }
    );
  }
}
