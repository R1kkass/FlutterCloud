import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/my_input.dart';
import 'package:flutter_application_2/cubit/content_bloc.dart';
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
    }, builder: (BuildContext cotnext, SearchController controller) {
      return MyInput(
          autoFocus: true,
          controller: controller,
          title: "Поиск по папке",
          icon: Icons.search,
          error: "Поле пустое",
          elevation: false,
          fieldSubmit: _findFile);
    });
  }

  _findFile(String text) async {
    context.read<ContentBloc>().add(SetSearch(search: text));
    var response = await FilesGrpc().findFile(FindFileRequest(
        search: text, folderId: widget.folderId, findEveryWhere: false));
    context
        .read<ContentBloc>()
        .add(ContentInit(files: response.files, folders: response.folders));
    if (text.isEmpty) {
      widget.fn();
    }
  }
}
