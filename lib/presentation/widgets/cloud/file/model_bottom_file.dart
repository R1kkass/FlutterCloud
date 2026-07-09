import 'package:TalkSpace/presentation/widgets/cloud/folder/file_component.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/delete_file_button.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/download_button.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/rename_file_button.dart';
import 'package:flutter/material.dart';

Null showModalFolder(context, FileComponent widget) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, setState) => SizedBox(
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      DeleteFileButton(
                        file: widget.file
                      ),
                      DownloadButton(file: widget.file),
                      RenameFileButton(file: widget.file),
                    ],
                  ),
                ),
              ),
            );
          });
    },
  );
}
