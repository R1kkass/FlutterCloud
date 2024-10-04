import 'package:flutter/material.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';

class FileDrag extends StatefulWidget {
  final File file;

  const FileDrag({super.key, required this.file});

  @override
  State<FileDrag> createState() => _FileDragState();
}

class _FileDragState extends State<FileDrag> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.insert_drive_file, size: 25),
            const SizedBox(width: 10),
            Text(widget.file.fileName,
                style: const TextStyle(
                  fontSize: 14,
                )),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
