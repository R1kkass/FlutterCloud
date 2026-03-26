import 'package:flutter/material.dart';
import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/features/file/file.dart';
import 'package:TalkSpace/features/file/upload_file.dart';
import 'package:TalkSpace/widget/folder/folder.dart';
import 'package:TalkSpace/features/file/move_to_main.dart';
import 'package:TalkSpace/pages/cloud.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FolderBuilder extends StatefulWidget {
  final int? folderId;
  const FolderBuilder({super.key, required this.folderId});

  @override
  State<FolderBuilder> createState() => _FolderBuilderState();
}

class DragFields {
  final int id;
  final String type;

  const DragFields({required this.id, required this.type});
}

class _FolderBuilderState extends State<FolderBuilder> {
  bool dragStart = false;
  static const _scrollThreshold = 1.00;
  late final ScrollController _scrollController;
  var page = 1;
  void callback(state) {
    setState(() {
      dragStart = state;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CloudArgs?;

    return BlocBuilder<ContentBloc, ContentState>(
      builder: (context, state) {
        List<Widget> children = [];
        if (!state.error) {
          List<dynamic> allFiles = [];
          var folderId = widget.folderId ?? 0;

          if (state.uploadFile[folderId] != null) {
            allFiles = [...allFiles, ...state.uploadFile[folderId]!.keys];
          }
          allFiles = [
            ...allFiles,
            ...state.folders,
            ...state.files,
          ];

          children = _paintFiles(allFiles, state.uploadFile);
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
        } else if (state.error) {
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
              ContentBloc.defaultRequestFile(
                  (args.runtimeType == CloudArgs) ? (args as CloudArgs).id : 0,
                  context);
            },
            child: ListView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                dragStart && args?.id != null
                    ? const MoveToMain()
                    : const SizedBox(height: 0),
                ...children,
              ],
            ));
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * _scrollThreshold &&
        !_scrollController.position.outOfRange) {
      page++;
      ContentBloc.paginationRequestFile(widget.folderId, page, context);
    }
  }

  List<Widget> _paintFiles(
      List<dynamic> contents, Map<int, Map<int, FileUpload?>> uploadFile) {
    List<Widget> children = [];
    var folderId = widget.folderId ?? 0;
    for (final (index, item) in contents.indexed) {
      if (item.runtimeType == Folder) {
        children.add(LongPressDraggable<DragFields>(
            data: DragFields(
                id: (item as Folder).id, type: "folder"),
            feedback: FolderComponent(folder: item),
            key: Key(index.toString()),
            onDragStarted: () {
              callback(true);
            },
            onDragEnd: (e) {
              callback(false);
            },
            child: FolderComponent(
              folder: item,
            )));
        continue;
      }
      if (item.runtimeType == File) {
        children.add(LongPressDraggable<DragFields>(
          onDragStarted: () {
            callback(true);
          },
          onDragEnd: (e) {
            callback(false);
          },
          data: DragFields(id: (item as File).id, type: "file"),
          dragAnchorStrategy: pointerDragAnchorStrategy,
          key: Key(index.toString()),
          feedback: FileComponent(file: item),
          child: FileComponent(file: item),
        ));
        continue;
      }
      if ((uploadFile[folderId])?[item].runtimeType == FileUpload) {
        children.add(
          UploadFile(
              file: (uploadFile[folderId])?[item] as FileUpload,
              folderId: folderId),
        );
      }
    }
    return children;
  }
}
