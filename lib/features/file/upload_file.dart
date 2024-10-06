import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadFile extends StatefulWidget {
  final FileUpload file;
  final int? folderId;

  const UploadFile({super.key, required this.file, required this.folderId});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 10),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
              const SizedBox(
                width: 15,
              ),
              Text(
                widget.file.fileName,
                style: TextStyle(
                    color: Colors.deepOrange.shade800,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  widget.file.callback?.cancel();
                  context
                      .read<FolderCubit>()
                      .removeUploadFile(widget.folderId, widget.file.id);
                },
                child: const Text("Отменить")),
          )
        ],
      ),
    );
  }
}
