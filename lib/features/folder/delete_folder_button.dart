import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/grpc/folder_grpc.dart';
import 'package:TalkSpace/pages/home.dart';
import 'package:TalkSpace/proto/files/files.pb.dart';
import 'package:TalkSpace/proto/folder/folder.pb.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteFolderButton extends StatefulWidget {
  const DeleteFolderButton({super.key, required this.folderId});

  final int folderId;

  @override
  State<DeleteFolderButton> createState() => _DeleteFolderButtonState();
}

class _DeleteFolderButtonState extends State<DeleteFolderButton> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;

    deleteFolder() async {
      await FolderGrpc()
          .deleteFolder(DeleteFolderRequest(folderId: widget.folderId));
      var response = await FilesGrpc().findFile(FindFileRequest(
          search: "", folderId: args?.id ?? 0, findEveryWhere: false));

      context
          .read<ContentBloc>()
          .add(ContentInit(files: response.files, folders: response.folders));
      showSuccessToast("Папка удалена");

      Navigator.of(context).pop();
    }

    delete() async {
      try {
        await deleteFolder();
      } catch (e) {
        showUnsuccessToast("Ошибка при удалении папки");
      }
    }

    return TextButton(
      onPressed: () async {
        await delete();
      },
      child: const Row(
        children: [
          Icon(Icons.delete_outline, size: 30),
          SizedBox(
            width: 15,
          ),
          Text(
            "Удалить",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
