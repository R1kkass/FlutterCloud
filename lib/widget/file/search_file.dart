import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/content_bloc.dart';
import 'package:flutter_application_2/features/file/search_input_file.dart';
import 'package:flutter_application_2/grpc/files_grpc.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFile extends StatefulWidget {
  final int? folderId;
  final Null Function() fn;

  const SearchFile({super.key, required this.folderId, required this.fn});

  @override
  State<SearchFile> createState() => _SearchFileState();
}

class _SearchFileState extends State<SearchFile> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(suggestionsBuilder:
        (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      });
    }, builder: (BuildContext context, SearchController controller) {
      return SearchInputFile(
          autoFocus: true,
          suffixIcon: context.read<ContentBloc>().state.search != ""
              ? IconButton(
                  onPressed: _cancelFindFile,
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.deepOrange.shade500,
                  ))
              : null,
          controller: controller,
          title: widget.folderId == null ? "Искать везде" : "Искать в папке",
          icon: Icons.search,
          error: "Поле пустое",
          elevation: false,
          fieldSubmit: _findFile);
    });
  }

  _findFile(String text) async {
    context.read<ContentBloc>().add(SetSearch(search: text));
    var response = await FilesGrpc().findFile(FindFileRequest(
        search: text,
        folderId: widget.folderId,
        findEveryWhere: widget.folderId == null));
    context
        .read<ContentBloc>()
        .add(ContentInit(files: response.files, folders: response.folders));
    if (text.isEmpty) {
      widget.fn();
    }
  }

  _cancelFindFile() async {
    context.read<ContentBloc>().add(SetSearch(search: ""));
    var response = await FilesGrpc().findFile(
        FindFileRequest(folderId: widget.folderId, findEveryWhere: false));
    context
        .read<ContentBloc>()
        .add(ContentInit(files: response.files, folders: response.folders));
    widget.fn();
  }
}
