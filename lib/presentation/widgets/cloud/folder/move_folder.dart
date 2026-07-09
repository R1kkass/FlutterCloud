import 'package:TalkSpace/data/repository/files_grpc.dart';
import 'package:TalkSpace/data/repository/folder_grpc.dart';
import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/move_view_model.dart';
import 'package:TalkSpace/presentation/views/cloud.dart';
import 'package:TalkSpace/presentation/widgets/cloud/cloud_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<MoveViewModel>(builder: (context, viewModel, child) {
        return DragTarget<DragFields>(
          builder: widget.builder,
          onWillAcceptWithDetails: (details) {
            if (details.data.type == "file") return true;
            return details.data.id != widget.folder.id;
          },
          onAcceptWithDetails: (details) async {
            if (details.data.type == "file") {
              await viewModel.moveFile(fileId: details.data.id, folderToId: widget.folder.id, currentFolderId: args?.folder?.id);
            } else {
              await viewModel.moveFolder(folderId: details.data.id, folderToId: widget.folder.id, currentFolderId: args?.folder?.id);
            }
          },
        );
      });
  }
}
