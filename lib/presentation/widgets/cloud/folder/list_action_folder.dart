import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/delete_folder_button.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/rename_folder_button.dart';
import 'package:flutter/material.dart';

class ListActionFolder extends StatefulWidget {
  const ListActionFolder({super.key, required this.folder, required this.currentRouteFolderId});

  final Folder folder;
  final int? currentRouteFolderId;

  @override
  State<ListActionFolder> createState() => _ListActionFolderState();
}

class _ListActionFolderState extends State<ListActionFolder> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            showModalFolder();
          },
          child: const Icon(Icons.more_vert, size: 20)),
    );
  }

  Null showModalFolder() {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) {
        return  SizedBox(
          child: Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DeleteFolderButton(
                  folder: widget.folder,
                  currentRouteFolderId: widget.currentRouteFolderId,
                ),
                RenameFolderButton(
                  folderId: widget.folder.id,
                  currentRouteFolderId: widget.currentRouteFolderId,
                ),
              ],
            ),
          )
        );
      },
    );
  }
}
