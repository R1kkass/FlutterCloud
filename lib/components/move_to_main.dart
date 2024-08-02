import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/api/folder_api.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/futureBuilders/folder_builder.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoveToMain extends StatefulWidget {
  const MoveToMain({super.key});

  @override
  State<MoveToMain> createState() => _MoveToMainState();
}

class _MoveToMainState extends State<MoveToMain> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;

    return DragTarget<DragFields>(onWillAcceptWithDetails: (details) {
      return true;
    }, onAcceptWithDetails: (details) {
      if (details.data.type == "file") {
        moveFile(details.data.id.toString(), "", context).then((e) async {
          await context.read<FolderCubit>().updateDataFetch(args?.id, context);
        });
      } else {
        moveFolder(details.data.id, "", context).then((e) {
          context.read<FolderCubit>().updateDataFetch(args?.id, context);
          // e.statusCode == 200
          //     ? showToast(context, "Папка перемещена")
          //     : showToast(context, "Папка не перемещена");
        });
      }
    }, builder: (context, candidateItems, rejectedItems) {
      return SizedBox(
          height: 60,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    candidateItems.isNotEmpty
                        ? Colors.deepOrange.shade100
                        : Colors.white)),
            child: const Text("Переместить на главную"),
          ));
    });
  }
}
