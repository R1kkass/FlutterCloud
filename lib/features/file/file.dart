import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/components/text_content.dart';
import 'package:flutter_application_2/features/file/model_bottom_file.dart';
import 'package:flutter_application_2/pages/open_file.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_application_2/services/file_size.dart';

class FileComponent extends StatefulWidget {
  final FileFind file;

  const FileComponent({super.key, required this.file});

  @override
  State<FileComponent> createState() => _FileComponentState();
}

class _FileComponentState extends State<FileComponent>
    with TickerProviderStateMixin {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.FILE,
              arguments: OpenFileArgs(file: widget.file));
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
                    TextContent(text: widget.file.fileName),
                    Text(
                      fileSize(widget.file.size.toInt()),
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
                    showModalFolder(context, widget);
                  },
                  child: const Icon(Icons.more_vert, size: 20)),
            )
          ],
        ),
      ),
    );
  }

  
}
