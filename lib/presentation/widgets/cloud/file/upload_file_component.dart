import 'package:TalkSpace/domain/model/entities/upload_file.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/upload_file_component_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadFileComponent extends StatefulWidget {
  final UploadFile file;
  final int? folderId;

  const UploadFileComponent({super.key, required this.file, required this.folderId});

  @override
  State<UploadFileComponent> createState() => _UploadFileComponentState();
}

class _UploadFileComponentState extends State<UploadFileComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UploadFileComponentViewModel>(builder: (context, viewModel, child) {
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
                    viewModel.cancel(widget.file.id);
                  },
                  child: const Text("Отменить")
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
