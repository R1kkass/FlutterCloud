import 'package:TalkSpace/presentation/viewmodels/cloud/file/common_file_download.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/scaffold/default_scaffold.dart';
import 'package:TalkSpace/presentation/widgets/cloud/file/downloading_file.dart';
import 'package:provider/provider.dart';

class Downloadings extends StatefulWidget {
  final String title;

  const Downloadings({super.key, required this.title});

  @override
  State<Downloadings> createState() => _DownloadingsState();
}

class _DownloadingsState extends State<Downloadings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CommonFileDownload>(builder: (context, viewModel, child) {
      if (viewModel.files.keys.isEmpty) {
        return DefaultScaffold(
            title: widget.title,
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 70),
                ],
              ),
            ));
      }

      return Consumer<CommonFileDownload>(builder: (context, viewModel, child) {
        return DefaultScaffold(
          floatButton: FloatingActionButton.extended(
              label: const Text('Очистить'),
              icon: const Icon(Icons.delete_forever_outlined, size: 30),
              onPressed: () async {
                await viewModel.clear();
              }),
          title: widget.title,
          body: ListView(
            children: [
              for (var key in viewModel.files.keys)
                DownloadingFile(
                    fileDownload: viewModel.files[key]!, id: key),
            ],
          )
        );
      });
    });
  }
}
