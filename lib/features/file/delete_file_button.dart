import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/proto/files/files.pb.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';

class DeleteFileButton extends StatefulWidget {
  final FileFind file;

  const DeleteFileButton({super.key, required this.file});

  @override
  State<DeleteFileButton> createState() => _DeleteFileButtonState();
}

class _DeleteFileButtonState extends State<DeleteFileButton> {
  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (!disabled) {
            await deleteFile();
          }
        },
        child: disabled ? ProgressDeleting() : DeleteFile());
  }

  deleteFile() async {
    try {
      await _deleteFile();
    } catch (e) {
      showUnsuccessToast("Не удалось удалить файл");
    }
    Navigator.pop(context);
    setState(() {
      disabled = false;
    });
  }

  _deleteFile() async {
    setState(() {
      disabled = true;
    });
    await FilesGrpc().deletefile(DeleteFileRequest(fileId: widget.file.id));
    ContentBloc.defaultRequestFile(widget.file.folderId, context);
  }
}

class ProgressDeleting extends StatelessWidget {
  const ProgressDeleting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 23,
            height: 23,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
        SizedBox(
          width: 15,
        ),
        Text(
          "Удаление...",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}

class DeleteFile extends StatefulWidget {
  const DeleteFile({super.key});

  @override
  State<DeleteFile> createState() => _DeleteFileState();
}

class _DeleteFileState extends State<DeleteFile> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
