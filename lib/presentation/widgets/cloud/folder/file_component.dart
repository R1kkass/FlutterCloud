import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/presentation/views/open_file.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/shared/text_content.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/model_bottom_file.dart';
import 'package:TalkSpace/services/file_size.dart';

class FileComponent extends StatelessWidget {
  final File file;

  const FileComponent({super.key, required this.file});

  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.FILE, arguments: OpenFileArgs(file: file));
        },
        style:
        ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.insert_drive_file_outlined, size: 27),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContent(text: file.media.fileName),
                    Text(
                      fileSize(file.media.size.toInt()),
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    showModalFolder(context, this);
                  },
                  child: const Icon(Icons.more_vert, size: 20)),
            )
          ],
        ),
      ),
    );
  }
}
