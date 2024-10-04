import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/folder_api.dart';
import 'package:flutter_application_2/features/file/file.dart';
import 'package:flutter_application_2/features/folder/folder.dart';
import 'package:flutter_application_2/components/move_to_main.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FolderBuilder extends StatefulWidget {
  const FolderBuilder({super.key});

  @override
  State<FolderBuilder> createState() => _FolderBuilderState();
}

class DragFields {
  final String id;
  final String type;

  const DragFields({required this.id, required this.type});
}

class _FolderBuilderState extends State<FolderBuilder> {
  bool dragStart = false;

  void callback(state) {
    setState(() {
      dragStart = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;
    return BlocBuilder<FolderCubit, GetData>(
      builder: (context, state) {
        List<Widget> children = [];

        if (state.status_code == 200) {
          var folders = state.body?.folders as List;
          var files = state.body?.files as List;
          paintList(children, folders, files, context);
        } else if (state.status_code != 200) {
          children = <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: const Center(
                  child: Icon(
                Icons.error,
                color: Colors.red,
                size: 70,
              )),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: const Center(child: CircularProgressIndicator()),
            )
          ];
        }
        children.add(const SizedBox(height: 70));
        return RefreshIndicator(
            onRefresh: () async {
              context.read<FolderCubit>().updateDataFetch(
                  (args.runtimeType == HomeArgs)
                      ? (args as HomeArgs).id
                      : 0,
                  context);
            },
            child: ListView(
              children: [
                dragStart && args?.id != null
                    ? const MoveToMain()
                    : const SizedBox(height: 0),
                ...children
              ],
            ));
      },
    );
  }

  paintList(children, folders, files, context) {
    for (var i = 0; i < folders.length; i++) {
      children.add(LongPressDraggable<DragFields>(
          data: DragFields(id: folders[i].id.toString(), type: "folder"),
          feedback: FolderComponent(folder: folders[i]),
          onDragStarted: () {
            callback(true);
          },
          onDragEnd: (e) {
            callback(false);
          },
          child: FolderComponent(
            folder: folders[i],
          )));
    }

    for (var i = 0; i < files.length; i++) {
      children.add(LongPressDraggable<DragFields>(
        onDragStarted: () {
          callback(true);
        },
        onDragEnd: (e) {
          callback(false);
        },
        data: DragFields(id: files[i].id.toString(), type: "file"),
        dragAnchorStrategy: pointerDragAnchorStrategy,
        key: Key(i.toString()),
        feedback: FileComponent(file: files[i]),
        child: FileComponent(file: files[i]),
      ));
    }

    if (files.length == 0 && folders.length == 0) {
      children.add(
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Icon(
                Icons.sentiment_dissatisfied,
                size: 100,
              )),
              Center(
                  child: Text(
                "Здесь пусто",
                style: TextStyle(fontSize: 30, color: Colors.deepOrange),
              )),
            ],
          ),
        ),
      );
    }
  }
}
