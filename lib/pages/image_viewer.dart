import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/hive_boxes.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key, required this.title});
  final String title;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int? index;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ImageViewerArgs?;
    index = index ?? args!.index;
    var secretKey =
        HiveBoxes().secretKey.get(args!.chatId.toString() + jwtDecode().email)!;
    PageController pageController = PageController(initialPage: args.index);

    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(125, 0, 0, 0),
      title: Text("${index! + 1} из ${args.images.length}",
          style: const TextStyle(color: Colors.white)),
      leading: Navigator.canPop(context) ||
              ModalRoute.of(context)!.settings.name != AppRouter.HOME
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.canPop(context)
                    ? Navigator.of(context).pop()
                    : ModalRoute.of(context)!.settings.name != AppRouter.HOME
                        ? Navigator.pushNamedAndRemoveUntil(
                            context, AppRouter.HOME, (r) => false)
                        : null;
              })
          : null,
    );
    int pageViewIndex = 0;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar,
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0 &&
                pageViewIndex < args.images.length - 1) {
              setState(() {
                pageViewIndex = pageViewIndex + 1;
              });
              pageController.animateToPage(pageViewIndex,
                  curve: Curves.bounceIn,
                  duration: const Duration(microseconds: 200));
            }
            // Swiping in left direction.
            if (details.delta.dx < 0 && pageViewIndex > 0) {
              setState(() {
                pageViewIndex = pageViewIndex - 1;
              });
              pageController.animateToPage(pageViewIndex,
                  curve: Curves.bounceIn,
                  duration: const Duration(microseconds: 200));
            }
          },
          child: PageView(
            onPageChanged: (page) {
              index = page;
              setState(() {});
            },
            controller: pageController,
            children: [
              for (var image in args.images)
                ImageViewerUnit(
                    image: image,
                    height: appBar.preferredSize.height,
                    secretKey: secretKey)
            ],
          ),
        ));
  }
}

class ImageViewerUnit extends StatefulWidget {
  const ImageViewerUnit(
      {super.key,
      required this.image,
      required this.height,
      required this.secretKey});

  final ChatFile image;
  final String secretKey;
  final double height;

  @override
  State<ImageViewerUnit> createState() => _ImageViewerUnitState();
}

class _ImageViewerUnitState extends State<ImageViewerUnit> {
  String path = "";
  bool downloaded = false;

  setStatus(pathFile) {
    path = pathFile;
    downloaded = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    var boxPath = HiveBoxes()
        .chatFileUploaded
        .get("${widget.image.id}${jwtDecode().email}");
    if (boxPath == null) {
      ChatGrpc().downloadChatFileFn(
          context,
          widget.image.id,
          EncryptMessage().decrypt(widget.image.fileName, widget.secretKey),
          widget.secretKey,
          setStatus);
    } else {
      setStatus(boxPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: SizedBox(
          height: MediaQuery.of(context).size.height - widget.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child:
                  FittedBox(fit: BoxFit.fill, child: Image.file(File(path))))),
    );
  }
}

class ImageViewerArgs {
  const ImageViewerArgs(
      {required this.images, required this.chatId, required this.index});

  final List<ChatFile> images;
  final int chatId;
  final int index;
}
