import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/file_component.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/cloud_list_view_model.dart';
import 'package:TalkSpace/presentation/widgets/cloud/folder/folder_component.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/cloud/move_to_main.dart';
import 'package:provider/provider.dart';

class CloudList extends StatefulWidget {
  final Folder? folder;
  const CloudList({super.key, required this.folder});

  @override
  State<CloudList> createState() => _CloudListState();
}

class DragFields {
  final int id;
  final String type;

  const DragFields({required this.id, required this.type});
}

class _CloudListState extends State<CloudList> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<CloudListViewModel>(context, listen: false).getFiles(widget.folder?.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CloudListViewModel>(builder: (context, viewModel, child) {
      viewModel.folderId = widget.folder?.id;
      List<Widget> _paintFiles(List<dynamic> contents) {
        List<Widget> children = [];
        for (final (index, item) in contents.indexed) {
          if (item.runtimeType == Folder) {
            children.add(LongPressDraggable<DragFields>(
                data: DragFields(
                    id: (item as Folder).id, type: "folder"),
                feedback: FolderComponent(folder: item, currentRouteFolderId: widget.folder?.id),
                key: Key(index.toString()),
                onDragStarted: () {
                  viewModel.setIsDrag(true);
                },
                onDragEnd: (e) {
                  viewModel.setIsDrag(false);
                },
                child: FolderComponent(
                  folder: item,
                  currentRouteFolderId: widget.folder?.id,
                )));
            continue;
          }
          if (item.runtimeType == File) {
            children.add(LongPressDraggable<DragFields>(
              onDragStarted: () {
                viewModel.setIsDrag(true);
              },
              onDragEnd: (e) {
                viewModel.setIsDrag(false);
              },
              data: DragFields(id: (item as File).id, type: "file"),
              dragAnchorStrategy: pointerDragAnchorStrategy,
              key: Key(index.toString()),
              feedback: FileComponent(file: item),
              child: FileComponent(file: item),
            ));
            continue;
          }
        }
        return children;
      }

      List<Widget> children = [];
      if (!viewModel.isError) {
        List<dynamic> allFiles = [];

        allFiles = [
          ...allFiles,
          ...viewModel.commonCloudData.data.folders,
          ...viewModel.commonCloudData.data.files,
        ];

        children = _paintFiles(allFiles);
        if (children.isEmpty) {
          children = [
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
          ];
        }
      } else if (viewModel.isError) {
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
            viewModel.commonCloudData.set(folderId: widget.folder?.id);
          },
          child: ListView(
            controller: viewModel.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              viewModel.dragStart && widget.folder != null
                  ? MoveToMain(folder: widget.folder)
                  : const SizedBox(height: 0),
              ...children,
            ],
          ));
    },
    );
  }
}
