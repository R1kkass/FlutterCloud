import 'dart:io';

import 'package:TalkSpace/presentation/viewmodels/messenger/message/file_gallery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FileGalleryImageUnit extends StatefulWidget {
  const FileGalleryImageUnit({super.key, required this.path,});

  final String path;

  @override
  State<FileGalleryImageUnit> createState() => _FileGalleryImageUnitState();
}

class _FileGalleryImageUnitState extends State<FileGalleryImageUnit> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    File file = File(widget.path);

    return Consumer<FileGalleryViewModel>(builder: (context, viewModel, child) {
      var index = viewModel.getIndex(widget.path) ?? "";

      return Stack(
        children: [
          Positioned.fill(
              top: 0,
              child: VisibilityDetector(
                  key: Key(widget.path),
                  onVisibilityChanged: (v) {
                    if (mounted) {
                      show = v.visibleFraction > 0.5;
                      setState(() {});
                    }
                  },
                  child: show
                      ? AnimatedScale(
                    duration: const Duration(milliseconds: 100),
                    scale: viewModel.selectedFiles[widget.path] != null ? .9 : 1,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.file(file),
                    ),
                  )
                      : const Center(
                    child: Icon(Icons.image),
                  ))),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: viewModel.selectedFiles[widget.path] != null
                      ? Colors.blueAccent
                      : Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Text("$index",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ),
              onTap: () {
                if (mounted) {
                  viewModel.selectFile(widget.path);
                }
              },
            ),
          ),
        ],
      );
    });
  }
}
