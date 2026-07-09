import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/message_file_default_provider.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/gallery/image_viewer_unit.dart';

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
    PageController pageController = PageController(initialPage: args!.index);

    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(125, 0, 0, 0),
      title: Text("${index! + 1} из ${args.message.messageFiles.length}",
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
    int pageViewIndex = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0 &&
              pageViewIndex < args.message.messageFiles.length - 1) {
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
            for (var image in args.message.messageFiles)
              MessageFileDefaultProvider(
                messageFile: image,
                child: ImageViewerUnit(
                  height: appBar.preferredSize.height,
                  message: args.message,
                )
            )
          ],
        ),
      )
    );
  }
}

class ImageViewerArgs {
  const ImageViewerArgs({
    required this.message,
    required this.index,
  });

  final int index;
  final Message message;
}
