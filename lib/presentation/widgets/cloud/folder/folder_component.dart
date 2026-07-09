import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/list_action_folder.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/move_folder.dart';
import 'package:TalkSpace/presentation/views/cloud.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/shared/text_content.dart';

class FolderComponent extends StatelessWidget {
  final Folder folder;
  final int? currentRouteFolderId;
  const FolderComponent({super.key, required this.folder, required this.currentRouteFolderId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: MoveFolder(
        folder: folder,
        builder: (context, candidateItems, _) {
          return TextButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    candidateItems.isNotEmpty
                        ? Colors.deepOrange.shade100
                        : Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.CLOUD, arguments: CloudArgs(folder));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.folder_outlined, size: 27),
                    const SizedBox(width: 10),
                    TextContent(text: folder.nameFolder)
                  ],
                ),
                const SizedBox(width: 10),
                ListActionFolder(
                  folder: folder,
                  currentRouteFolderId: currentRouteFolderId,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
