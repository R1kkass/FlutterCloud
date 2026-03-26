import 'dart:convert';
import 'dart:typed_data';

import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/entities/chat/image_viewer_unit_read.dart';
import 'package:TalkSpace/features/file/actions/download_action.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';

interface class OpenFileArgs {
  final File file;

  OpenFileArgs({required this.file});
}

class Openfile extends StatefulWidget {
  const Openfile({super.key, required this.title});

  final String title;
  @override
  State<Openfile> createState() => _OpenfileState();
}

class _OpenfileState extends State<Openfile> {
  String title = "";
  bool loading = true;
  Uint8List bytesFile = Uint8List(0);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _asyncInit();
    });
  }

  Widget chilren = const CircularProgressIndicator();
  OpenFileArgs? args;

  _asyncInit() async {
    args = ModalRoute.of(context)!.settings.arguments as OpenFileArgs?;

    setState(() {
      title = args?.file.media.fileName ?? widget.title;
    });
    await openFile();
  }

  openFile() async {
    try {
      await _openFile();
    } catch (e) {
      showUnsuccessToast("Не удалось открыть файл");
      setState(() {
        loading = false;
      });
    }
  }

  _openFile() async {
    var downloadFile = FilesGrpc().downloadFile(
      FileDownloadRequest(
        fileId: args?.file.id,
        folderId: args?.file.folderId,
      ),
    );

    var downloadAction = DownloadAction(
        context: context,
        fileName: args!.file.media.fileName,
        fileId: args!.file.id,
        downloadFile: downloadFile);

    await downloadAction.listenReadFile(byteFiles);
  }

  byteFiles(Uint8List bytes) {
    setState(() {
      bytesFile = bytes;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as OpenFileArgs?;

    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(125, 0, 0, 0),
      title: Text(args?.file.media.fileName ?? widget.title,
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
            String? type = args?.file.media.fileName.split(".").last;
            var expText = RegExp("txt|js|ts|go|dart|proto|c|cpp|php|tsx|jsx|vue|css|html");
            var expImage = RegExp(
                "mp4|3gp|ogg|wmv|webm|flv|avi*|wav|vob*|gif|jpe?g|tiff?|png|webp|bmp");

            if (type.runtimeType == String && bytesFile.isNotEmpty) {
              if (expText.hasMatch(type!)) {
                return Text(utf8.decode(bytesFile));
              } else if (expImage.hasMatch(type)) {
                return ImageViewerUnitRead(
                  fileBytes: bytesFile,
                  typeFile: type,
                  height: appBar.preferredSize.height,
                );
              }
            }

            if (loading) {
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
  }
}
