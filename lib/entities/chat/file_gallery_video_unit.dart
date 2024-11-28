import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FilegalleryVideoUnit extends StatefulWidget {
  const FilegalleryVideoUnit(
      {super.key,
      required this.path,
      required this.selectFile,
      required this.selectedFiles});

  final String path;
  final void Function(String) selectFile;
  final Map<String, bool> selectedFiles;

  @override
  State<FilegalleryVideoUnit> createState() => _FilegalleryVideoUnitState();
}

class _FilegalleryVideoUnitState extends State<FilegalleryVideoUnit> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    // VideoPlayerController controller =
    //     VideoPlayerController.file(File(widget.path));
    var index = widget.selectedFiles[widget.path] != null
        ? widget.selectedFiles.keys.toList().indexOf(widget.path) + 1
        : "";
    return Stack(
      children: [
        Positioned.fill(
            top: 0,
            child: VisibilityDetector(
                key: Key(widget.path),
                onVisibilityChanged: (v) {
                  show = v.visibleFraction > 0.5;
                  setState(() {});
                },
                child: show
                    ? AnimatedScale(
                        duration: const Duration(milliseconds: 100),
                        scale:
                            widget.selectedFiles[widget.path] != null ? .9 : 1,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.file(File(widget.path)),
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
                color: widget.selectedFiles[widget.path] != null
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
              widget.selectFile(widget.path);
            },
          ),
        )
      ],
    );
  }
}
