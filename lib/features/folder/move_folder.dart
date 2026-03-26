import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/grpc/folder_grpc.dart';
import 'package:TalkSpace/pages/cloud.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:TalkSpace/widget/folder/folder_builder.dart';
import 'package:flutter/material.dart';

class MoveFolder extends StatefulWidget {
  const MoveFolder({super.key, required this.builder, required this.folder});

  final Widget Function(BuildContext, List<DragFields?>, List<dynamic>) builder;
  final Folder folder;

  @override
  State<MoveFolder> createState() => _MoveFolderState();
}

class _MoveFolderState extends State<MoveFolder> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as CloudArgs?;
    return DragTarget<DragFields>(
      builder: widget.builder,
      onWillAcceptWithDetails: (details) {
        if (details.data.type == "file") return true;
        return details.data.id != widget.folder.id;
      },
      onAcceptWithDetails: (details) async {
        if (details.data.type == "file") {
          await FilesGrpc()
              .moveFile(details.data.id, widget.folder.id, args?.id ?? 0);
        } else {
          await FolderGrpc()
              .moveFolder(details.data.id, widget.folder.id, args?.id ?? 0);
        }
      },
    );
  }
}
