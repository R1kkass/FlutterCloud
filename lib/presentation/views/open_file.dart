import 'dart:convert';
import 'dart:typed_data';

import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/gallery/image_viewer_unit_read.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/open_file_view_model.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

interface class OpenFileArgs {
  final File file;

  OpenFileArgs({required this.file});
}

class OpenFile extends StatefulWidget {
  const OpenFile({super.key, required this.title});

  final String title;
  @override
  State<OpenFile> createState() => _OpenFileState();
}

class _OpenFileState extends State<OpenFile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OpenFileViewModel>(builder: (context, viewModel, child) {
      var args = ModalRoute.of(context)!.settings.arguments as OpenFileArgs;
      openFile() async {
        try {
          await viewModel.openFile(args.file);
        } catch (e) {
          showUnsuccessToast("Не удалось открыть файл");
        }
      }
      openFile();

      final appBar = AppBar(
        backgroundColor: const Color.fromARGB(125, 0, 0, 0),
        title: Text(args.file.media.fileName ?? widget.title,
            style: const TextStyle(color: Colors.white)),
        leading: Navigator.canPop(context) ||
            ModalRoute.of(context)!.settings.name != AppRouter.CLOUD
            ? IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.canPop(context)
                  ? Navigator.of(context).pop()
                  : ModalRoute.of(context)!.settings.name != AppRouter.CLOUD
                  ? Navigator.pushNamedAndRemoveUntil(
                  context, AppRouter.CLOUD, (r) => false)
                  : null;
            })
            : null,
      );

      return Scaffold(
          backgroundColor: Colors.black,
          appBar: appBar,
          body: Center(
            child: Builder(builder: (BuildContext context) {
              String type = args.file.media.fileName.split(".").last;
              var expText = RegExp("txt|js|ts|go|dart|proto|c|cpp|php|tsx|jsx|vue|css|html");
              var expImage = RegExp(
                  "mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*|gif|jpe?g|tiff?|png|webp|bmp");

              if (type.runtimeType == String && viewModel.fileBytes.isNotEmpty) {
                if (expText.hasMatch(type)) {
                  return Text(utf8.decode(viewModel.fileBytes));
                } else if (expImage.hasMatch(type)) {
                  return ImageViewerUnitRead(
                    fileBytes: Uint8List.fromList(viewModel.fileBytes),
                    typeFile: type,
                    height: appBar.preferredSize.height,
                  );
                }
              }

              if (viewModel.loading) {
                return CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                );
              }

              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.sentiment_dissatisfied, size: 100),
                  Text(
                    "Не возможно открыть файл",
                    style: TextStyle(fontSize: 24, color: Colors.deepOrange),
                  ),
                ],
              );
            }),
          ));
    });
  }
}
