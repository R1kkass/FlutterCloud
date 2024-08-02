import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/components/dialog_loading.dart';
import 'package:flutter_application_2/components/toast.dart';
import 'package:http/http.dart';

const List<String> accesses = ["Закрытый", "Открытый", "По запросу"];

void showDialogAccess(
  Future<Response> Function(ChangeAccessListArgs) callback,
  String? file_id,
  String? folder_id,
  BuildContext context,
) {
  Navigator.of(context).pop();
  String? valueAccess = accesses[0];

  acceptChange() async {
    Navigator.of(context).pop();
    showLoaderDialog(context);

    await callback(ChangeAccessListArgs(
            args: ChangeAccessRequest(
                folder_id: folder_id.toString(),
                file_id: file_id.toString(),
                access_id:
                    (accesses.indexOf(valueAccess as String) + 1).toString()),
            context: context))
        .then((e) {
      e.statusCode == 200
          ? showToast(context, "Доступ успешно изменён")
          : showToast(context, "Доступ не был изменён");
    }).catchError((e) {
      showToast(context, "Доступ не был изменён");
    });
    Navigator.of(context).pop();
  }

  showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return AlertDialog(
              insetPadding: const EdgeInsets.all(1),
              title: const Text("Изменить доступ"),
              content: DropdownButton(
                onChanged: (valueMenu) {
                  setState(() {
                    valueAccess = valueMenu;
                  });
                },
                items: accesses.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: valueAccess,
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
                  child: const Text("Изменить"),
                  onPressed: () async {
                    acceptChange();
                  },
                ),
              ],
            );
          },
        );
      });
}
