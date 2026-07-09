import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/show_create_folder_modal.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/upload_file_button.dart';
import 'package:flutter/material.dart';

class BottomSheetFile extends StatefulWidget {
  final Folder? folder;

  const BottomSheetFile({
    super.key,
    required this.folder,
  });

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
                      builder: (BuildContext context, setState) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ShowCreateFolderModal(folder: widget.folder),
                            const SizedBox(
                              width: 25,
                            ),
                            UploadFileButton(folder: widget.folder)
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
