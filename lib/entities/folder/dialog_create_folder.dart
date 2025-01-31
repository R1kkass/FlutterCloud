import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/proto/files/files.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showDialogRename({
  required String hintText,
  required BuildContext context,
  required int folderId,
  required Function(String) callback,
  required String title,
}) {
  Navigator.of(context).pop();
  var name = TextEditingController();
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(1),
        title: Text(title),
        content: TextField(
          controller: name,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintText: hintText),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Отмена'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text("Переименовать"),
            onPressed: () async {
              await callback(name.text);
              var response = await FilesGrpc().findFile(FindFileRequest(
                  search: "",
                  folderId: folderId,
                  findEveryWhere: false));

              context.read<ContentBloc>().add(ContentInit(
                  files: response.files, folders: response.folders));
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
