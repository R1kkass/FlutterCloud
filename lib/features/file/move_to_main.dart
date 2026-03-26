import 'package:TalkSpace/grpc/folder_grpc.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/widget/folder/folder_builder.dart';
import 'package:TalkSpace/pages/cloud.dart';

class MoveToMain extends StatefulWidget {
  const MoveToMain({super.key});

  @override
  State<MoveToMain> createState() => _MoveToMainState();
}

class _MoveToMainState extends State<MoveToMain> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CloudArgs?;

    return DragTarget<DragFields>(onWillAcceptWithDetails: (details) {
      return true;
    }, onAcceptWithDetails: (details) async {
      if (details.data.type == "file") {
        await FilesGrpc().moveFile(details.data.id, 0, args?.id ?? 0);
      } else {
        await FolderGrpc().moveFolder(details.data.id, 0, args?.id ?? 0);
      }
    }, builder: (context, candidateItems, rejectedItems) {
      return SizedBox(
          height: 60,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    candidateItems.isNotEmpty
                        ? Colors.deepOrange.shade100
                        : Colors.white)),
            child: const Text("Переместить на главную"),
          ));
    });
  }
}
