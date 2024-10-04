import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class OpenFileButton extends StatefulWidget {
  final String path;

  const OpenFileButton({super.key, required this.path});

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
          Text(
            "Файл скачан",
            style: TextStyle(
                fontSize: 16,
                color: Colors.deepOrange.shade800,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          SizedBox(
              child: TextButton(
                  onPressed: () async {
                    await OpenFile.open(widget.path, type: "public.plain-text");
                  },
                  child: const Text("Открыть")))
        ],
      ),
    );
  }
}
