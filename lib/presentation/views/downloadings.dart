import 'package:flutter/material.dart';
import 'package:TalkSpace/components/default_scaffold.dart';
import 'package:TalkSpace/cubit/download_file_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/widget/chat/downloading_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Downloadings extends StatefulWidget {
  final String title;

  const Downloadings({super.key, required this.title});

  @override
  State<Downloadings> createState() => _DownloadingsState();
}

class _DownloadingsState extends State<Downloadings> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadFileBloc, DownloadFileState>(
        builder: (context, state) {
      var downloadFile = state.downloadFile;

      if (downloadFile.keys.isEmpty) {
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

      return DefaultScaffold(
          floatButton: FloatingActionButton.extended(
              label: const Text('Очистить'),
              icon: const Icon(Icons.delete_forever_outlined, size: 30),
              onPressed: () {
                context
                    .read<DownloadFileBloc>()
                    .add(const FolderRemoveDownloadFiles());
              }),
          title: widget.title,
          body: ListView(
            children: [
              for (var key in downloadFile.keys)
                DownloadingFile(
                    file: downloadFile[key] as FileDownload, id: key),
            ],
          ));
    });
  }
}
