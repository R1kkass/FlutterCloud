import 'package:flutter/material.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

void showDialogRename(
    Future<Response> Function(String?, String, BuildContext) callback,
    String? id,
    BuildContext context,
    {required String hintText,
    required String title,
    required String successMessage,
    required String errorMessage,
    required TextEditingController nameFolder}) {
  Navigator.of(context).pop();
  final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;

  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(1),
        title: Text(title),
        content: TextField(
          controller: nameFolder,
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
              callback(id, nameFolder.text, context).then((e) {
                context.read<FolderCubit>().updateDataFetch(
                    (args.runtimeType == HomeArgs)
                        ? (args as HomeArgs).id
                        : 0,
                    context);

                e.statusCode == 200
                    ? showToast(context, successMessage)
                    : showToast(context, errorMessage);
              }).catchError((e) {
                showToast(context, errorMessage);
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}