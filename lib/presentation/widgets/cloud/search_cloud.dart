import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/search_cloud_view_model.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/cloud/search_input_file.dart';
import 'package:provider/provider.dart';

class SearchCloud extends StatefulWidget {
  final Folder? folder;
  final Null Function() fn;

  const SearchCloud({super.key, required this.folder, required this.fn});

  @override
  State<SearchCloud> createState() => _SearchCloudState();
}

class _SearchCloudState extends State<SearchCloud> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchCloudViewModel>(builder: (context, viewModel, child) {
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
            suffixIcon: viewModel.searchField != ""
                ? IconButton(
                onPressed: () => viewModel.clear(widget.folder?.id),
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.deepOrange.shade500,
                ))
                : null,
            controller: controller,
            title: widget.folder == null ? "Искать везде" : "Искать в папке",
            icon: Icons.search,
            error: "Поле пустое",
            elevation: false,
            fieldSubmit: (text) => viewModel.search(text, widget.folder?.id));
      });
    });
  }
}
