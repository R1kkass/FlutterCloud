import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/chat_input.dart';
import 'package:flutter_application_2/entities/chat/file_gallery_type.dart';
import 'package:flutter_application_2/widget/chat/file_gallery_files.dart';
import 'package:flutter_application_2/widget/chat/file_gallery_images.dart';
import 'dart:io' as io;
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';

class FileGallery extends StatefulWidget {
  final int chatId;
  final String secretKey;
  final dynamic Function(Map<String, bool> selectedFiles, String text)
      functionCreate;
  final TextEditingController textController;
  const FileGallery(
      {super.key,
      required this.secretKey,
      required this.chatId,
      required this.textController,
      required this.functionCreate});

  @override
  State<FileGallery> createState() => _FileGalleryState();
}

class _FileGalleryState extends State<FileGallery>
    with TickerProviderStateMixin {
  List<io.FileSystemEntity> files = [];
  Map<String, bool> selectedFiles = {};
  final ScrollController _scrollController = ScrollController();
  bool sizeModal = false;
  double _messageInputHeight = 0;
  bool _inputFocused = false;
  final KeyboardHeightPlugin _keyboardHeightPlugin = KeyboardHeightPlugin();

  var globalKey = GlobalKey<FileGalleryImagesState>();

  @override
  void initState() {
    super.initState();
    _keyboardHeightPlugin.onKeyboardHeightChanged((double height) {
      setState(() {
        _messageInputHeight = height + _messageInputHeight;
      });
    });
    _scrollController.addListener(() {
      if (!_scrollController.keepScrollOffset &&
          !sizeModal &&
          _scrollController.offset == 0) {
        sizeModal = true;
        setState(() {});
      } else if (_scrollController.keepScrollOffset) {
        sizeModal = true;
        setState(() {});
      }
    });
  }

  int _count = 0;

  _selectFile(path) {
    globalKey.currentState?.files;
    if (selectedFiles[path] == null && selectedFiles.keys.length < 10) {
      selectedFiles[path] = true;
    } else {
      selectedFiles.remove(path);
    }
    _count = selectedFiles.length;
    _setMessageInputHeight();
    setState(() {});
  }

  _setMessageInputHeight() {
    setState(() {
      if (_count != 0 && !_inputFocused) {
        _messageInputHeight = 60;
        return;
      }
      if (_count == 0) {
        _messageInputHeight = 0;
      }
    });
  }

  var typeChild = "Галерея";

  setCurrentFileType(String type) {
    typeChild = type;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var childs = {
      "Галерея": FileGalleryImages(
          scrollController: _scrollController,
          selectedFiles: selectedFiles,
          selectFile: _selectFile),
      "Файл": FileGalleryFiles(
          scrollController: _scrollController,
          selectedFiles: selectedFiles,
          selectFile: _selectFile)
    };

    var height = MediaQuery.of(context).size.height;
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        height: sizeModal ? height - 100 : height / 1.7,
        child: Column(children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12,
            ),
          ),
          Row(
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  height: _count == 0 ? 0 : 30,
                  child: Text(
                    "Выбрано файлов: $_count",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          FileGalleryType(action: setCurrentFileType),
          Builder(builder: (context) {
            return Expanded(
              child: childs[typeChild] ?? const SizedBox(),
            );
          }),
          AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                height: _messageInputHeight,
                child: Focus(
                  onFocusChange: (hasFocus) {
                    _inputFocused = hasFocus;
                    _setMessageInputHeight();
                  },
                  child: ChatInput(
                      controller: widget.textController,
                      fieldSubmit: (text) {
                        widget.functionCreate(selectedFiles, text);
                      },
                      title: "Сообщение",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          icon: const Icon(Icons.send_rounded),
                          color: Colors.deepOrange.shade500,
                          onPressed: () {
                            widget.functionCreate(
                                selectedFiles, widget.textController.text);
                          },
                          iconSize: 25,
                        ),
                      ),
                      error: ""),
                ),
              ))
        ]),
      ),
    );
  }
}
