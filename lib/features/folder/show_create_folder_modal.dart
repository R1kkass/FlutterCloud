import 'package:TalkSpace/widget/file/create_folder_modal.dart';
import 'package:flutter/material.dart';

class ShowCreateFolderModal extends StatefulWidget {
  final int? id;

  const ShowCreateFolderModal({super.key, required this.id});

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
          id: widget.id,
        );
      },
    );
  }
}
