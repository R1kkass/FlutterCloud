import 'package:flutter/material.dart';
import 'package:TalkSpace/entities/chat/grid_images_general.dart';
import 'package:TalkSpace/entities/chat/image_chat_file.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/encrypt_message.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GridImages extends StatefulWidget {
  const GridImages({super.key, required this.message, required this.secretKey, required this.images});

  final List<MessageFile> images;
  final String secretKey;
  final Message message;

  @override
  State<GridImages> createState() => _GridImagesState();
}

class _GridImagesState extends State<GridImages> {
  @override
  Widget build(BuildContext context) {
    var gridImagesGeneral = GridImagesGeneral(context);
    var currentAreas = gridImagesGeneral.getAreas(widget.images.length);
    return GeneralLayoutGrid(
        secretKey: widget.secretKey,
        message: widget.message,
        areas: currentAreas!);
  }
}

class GeneralLayoutGrid extends GridImagesGeneralProps {
  const GeneralLayoutGrid({
    super.key,
    required super.message,
    required super.areas,
    required this.secretKey,
  });

  final String secretKey;
  @override
  State<GeneralLayoutGrid> createState() => _GeneralLayoutGridState();
}

class _GeneralLayoutGridState extends State<GeneralLayoutGrid> {
  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      areas: widget.areas.areas,
      rowGap: 0,
      columnGap: 0,
      columnSizes: widget.areas.columnSizes,
      rowSizes: widget.areas.rowsSizesTrackSize,
      children: [
        for (var (key, image) in widget.message.messageFiles.indexed)
          ImageChatFile(
            index: key,
            secretKey: widget.secretKey,
            image: image,
            size: widget.areas.size[key],
            images: widget.message.messageFiles,
            message: widget.message,
            fileName:
                EncryptMessage().decrypt(image.fileName, widget.secretKey),
          ).inGridArea("img$key"),
      ],
    );
  }
}
