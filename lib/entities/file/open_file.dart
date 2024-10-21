import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';

class OpenFileButton extends StatefulWidget {
  final String path;
  final String fileName;

  const OpenFileButton({super.key, required this.path, required this.fileName});

  @override
  State<OpenFileButton> createState() => _OpenFileState();
}

class _OpenFileState extends State<OpenFileButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 5),
      child: Row(
        children: [
          Icon(
            Icons.check,
            size: 30,
            color: Colors.deepOrange.shade800,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Файл "${widget.fileName}" скачан',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepOrange.shade800,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () async {
                  await OpenFile.open(widget.path);
                },
                child: const Text("Открыть")),
          ),
        ],
      ),
    );
  }
}
