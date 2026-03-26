import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/features/folder/delete_folder_button.dart';
import 'package:TalkSpace/features/folder/rename_folder_button.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListActionFolder extends StatefulWidget {
  const ListActionFolder({super.key, required this.folder});

  final Folder folder;

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
        return BlocProvider.value(
          value: BlocProvider.of<FolderCubit>(context),
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DeleteFolderButton(
                    folderId: widget.folder.id,
                  ),
                  RenameFolderButton(
                    folderId: widget.folder.id,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
