import 'package:TalkSpace/features/folder/show_create_folder_modal.dart';
import 'package:TalkSpace/widget/chat/upload_file_button.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/cubit/content_bloc.dart';

class BottomSheetFile extends StatefulWidget {
  final int? id;
  final ContentState state;
  final BuildContext context;

  const BottomSheetFile(
      {super.key,
      required this.id,
      required this.state,
      required this.context});

  @override
  State<BottomSheetFile> createState() => _BottomSheetFile();
}

class _BottomSheetFile extends State<BottomSheetFile> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('Создать'),
      icon: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return BottomSheet(
                onClosing: () {},
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext cotnext, setState) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ShowCreateFolderModal(id: widget.id),
                            const SizedBox(
                              width: 25,
                            ),
                            UploadFileButton(id: widget.id)
                          ],
                        ),
                      ),
                    );
                  });
                });
          },
        );
      },
    );
  }
}
