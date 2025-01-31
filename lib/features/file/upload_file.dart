import 'package:flutter/material.dart';
import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 10),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Flexible(
              child: Text(
                widget.file.fileName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.deepOrange.shade800,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    widget.file.callback?.cancel();
                    context.read<ContentBloc>().add(UploadFileRemove(
                        folderId: widget.folderId, id: widget.file.id));
                  },
                  child: const Text("Отменить")),
            )
          ],
        ),
      ),
    );
  }
}
