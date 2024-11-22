import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/chat_input.dart';
import 'dart:io' as io;
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
import 'package:path_provider/path_provider.dart';

class FileGallery extends StatefulWidget {
  const FileGallery({super.key});

  @override
  State<FileGallery> createState() => _FileGalleryState();
}

class _FileGalleryState extends State<FileGallery>
    with TickerProviderStateMixin {
  List<io.FileSystemEntity> files = [];
  Map<String, bool> selectedFiles = {};
  final ScrollController _scrollController = ScrollController();
  bool sizeModal = false;
  final TextEditingController _messsageController = TextEditingController();
  double _messageInputHeight = 0;
  bool _inputFocused = false;
  final KeyboardHeightPlugin _keyboardHeightPlugin = KeyboardHeightPlugin();

  @override
  void initState() {
    super.initState();
    _keyboardHeightPlugin.onKeyboardHeightChanged((double height) {
      setState(() {
        _messageInputHeight = height + _messageInputHeight;
      });
    });
    // _prevOffset = _scrollController.offset;
    _scrollController.addListener(() {
      log((!_scrollController.keepScrollOffset &&
              !sizeModal &&
              _scrollController.offset == 0)
          .toString());
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

    WidgetsBinding.instance.addPostFrameCallback((e) async {
      String directory;
      directory = (await getApplicationDocumentsDirectory()).path;

      // TODO: Сделать путь до директории изображений
      // if (io.Platform.isIOS) {
      //   directory = (await getApplicationSupportDirectory()).path;
      // } else {
      // directory = '/storage/emulated/0/Android/data/';
      // }
      files = io.Directory(directory).listSync();
      setState(() {});
    });
  }

  int _count = 0;

  _selectFile(path) {
    if (selectedFiles[path] == null) {
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
      // if (_count != 0 && _inputFocused) {
      //   _messageInputHeight = _keyboardHeight;
      //   return;
      // }
      if (_count != 0 && !_inputFocused) {
        _messageInputHeight = 60;
        return;
      }
      if (_count == 0) {
        _messageInputHeight = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext cotnext, setState) {
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
            Expanded(
              child: GridView.count(
                controller: _scrollController,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: [
                  for (var file in files)
                    AnimatedScale(
                      duration: const Duration(milliseconds: 100),
                      scale: selectedFiles[file.path] != null ? .9 : 1,
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: Text(file.path),
                        ),
                        onTap: () {
                          _selectFile(file.path);
                        },
                      ),
                    ),
                ],
              ),
            ),
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
                        controller: _messsageController,
                        title: "Сообщение",
                        icon: Icons.mail,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: IconButton(
                            icon: const Icon(Icons.send),
                            color: Colors.deepOrange.shade400,
                            onPressed: () {},
                            iconSize: 25,
                          ),
                        ),
                        error: "error"),
                  ),
                ))
          ]),
        ),
      );
    });
  }
}
