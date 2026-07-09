import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/delete_file_view_model.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteFileButton extends StatefulWidget {
  final File file;

  const DeleteFileButton({super.key, required this.file});

  @override
  State<DeleteFileButton> createState() => _DeleteFileButtonState();
}

class _DeleteFileButtonState extends State<DeleteFileButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteFileViewModel>(builder: (context, viewModel, child) {
      deleteFile() async {
        try {
          await viewModel.delete(widget.file);
        } catch (e) {
          showUnsuccessToast("Не удалось удалить файл");
        }
        Navigator.pop(context);
      }

      return TextButton(
          onPressed: () async {
            if (!viewModel.isLoading) {
              await deleteFile();
            }
          },
          child: Row(
            children: [
              viewModel.isLoading ?
              SizedBox(
                  width: 23,
                  height: 23,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )
              ) :
              Icon(Icons.delete_outline, size: 30),
              SizedBox(
                width: 15,
              ),
              Text(
                "Удалить",
                style: TextStyle(fontSize: 16),
              )
            ],
          )
      );
    });
  }
}
