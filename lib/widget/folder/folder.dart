import 'package:TalkSpace/features/folder/list_action_folder.dart';
import 'package:TalkSpace/features/folder/move_folder.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/shared/text_content.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:TalkSpace/pages/cloud.dart';

class FolderComponent extends StatefulWidget {
  final Folder folder;
  const FolderComponent({super.key, required this.folder});

  @override
  State<FolderComponent> createState() => _FolderState();
}

class _FolderState extends State<FolderComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: MoveFolder(
        folder: widget.folder,
        builder: (context, candidateItems, _) {
          return TextButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    candidateItems.isNotEmpty
                        ? Colors.deepOrange.shade100
                        : Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.CLOUD,
                  arguments:
                      CloudArgs(widget.folder.id, widget.folder.nameFolder));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.folder_outlined, size: 27),
                    const SizedBox(width: 10),
                    TextContent(text: widget.folder.nameFolder)
                  ],
                ),
                const SizedBox(width: 10),
                ListActionFolder(
                  folder: widget.folder,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
