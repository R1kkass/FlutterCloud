import 'dart:io';

import 'package:TalkSpace/presentation/viewmodels/messenger/message/file_gallery_view_model.dart';
import 'package:TalkSpace/services/get_file_name.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/services/file_size.dart';
import 'package:TalkSpace/services/get_download_path.dart';
import 'package:TalkSpace/shared/text_button_gallery.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class GalleryFile extends StatefulWidget {
  const GalleryFile({super.key, required this.path});

  final String path;

  @override
  State<GalleryFile> createState() => _GalleryFileState();
}

class _GalleryFileState extends State<GalleryFile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var file = File(widget.path);

    return Consumer<FileGalleryViewModel>(builder: (context, viewModel, child) {
      var index = viewModel.getIndex(widget.path) ?? "";

      return TextButtonGallery(
        action: () => viewModel.selectFile(widget.path),
        color: Colors.blueAccent,
        icon: Icons.insert_drive_file,
        text: getFileName(file),
        secondaryText: fileSize(file.lengthSync()),
        child: SizedBox(
          width: 45,
          height: 45,
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.insert_drive_file,
                  color: Colors.blueAccent,
                  size: 40,
                ),
              ),
              AnimatedScale(
                duration: const Duration(milliseconds: 500),
                scale: viewModel.selectedFiles[widget.path] != null ? 1 : 0,
                child: Positioned(
                    bottom: 2,
                    right: 3,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange.shade400,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text("$index",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11))),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
