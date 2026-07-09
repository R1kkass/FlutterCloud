import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/create_folder_modal.dart';
import 'package:flutter/material.dart';

class ShowCreateFolderModal extends StatefulWidget {
  final Folder? folder;

  const ShowCreateFolderModal({super.key, required this.folder});

  @override
  State<ShowCreateFolderModal> createState() => _ShowCreateFolderModalState();
}

class _ShowCreateFolderModalState extends State<ShowCreateFolderModal> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const SizedBox(
          height: 50,
          child: Column(
            children: [
              Icon(Icons.create_new_folder_outlined),
              Text("Добавить папку")
            ],
          ),
        ),
        onPressed: () => {
              Navigator.of(context).pop(),
              showDialogBuilder(context),
            });
  }

  Null showDialogBuilder(context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return CreateFolderModal(
          folder: widget.folder,
        );
      },
    );
  }
}
