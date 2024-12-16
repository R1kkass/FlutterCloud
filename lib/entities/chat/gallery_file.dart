import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/file_size.dart';
import 'package:flutter_application_2/services/get_download_path.dart';
import 'package:flutter_application_2/shared/text_button_gallery.dart';
import 'package:open_file_plus/open_file_plus.dart';

class GalleryFile extends StatefulWidget {
  const GalleryFile(
      {super.key,
      required this.file,
      required this.selectedFiles,
      required this.selectFile});

  final File file;
  final Map<String, bool> selectedFiles;
  final void Function(String) selectFile;

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
    openChatfile() async {
      var downloadPath = await getDownloadPath() ?? "";

      await OpenFile.open(
        "$downloadPath/${widget.file.path.split("/").last}",
      );
    }

    var index = widget.selectedFiles[widget.file.path] != null
        ? widget.selectedFiles.keys.toList().indexOf(widget.file.path) + 1
        : "";

    return TextButtonGallery(
      action: () => widget.selectFile(widget.file.path),
      color: Colors.blueAccent,
      icon: Icons.insert_drive_file,
      text: widget.file.path.split("/").last,
      secondaryText: fileSize(widget.file.lengthSync()),
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
              scale: widget.selectedFiles[widget.file.path] != null ? 1 : 0,
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
  }
}
