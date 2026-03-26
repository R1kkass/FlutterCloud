import 'package:flutter/material.dart';
import 'package:TalkSpace/entities/chat/grid_images_general.dart';
import 'package:TalkSpace/entities/chat/image_chat_file_upload.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GridImagesUpload extends StatefulWidget {
  const GridImagesUpload(
      {super.key, required this.message, required this.secretKey});

  final Message message;
  final String secretKey;

  @override
  State<GridImagesUpload> createState() => _GridImagesUploadState();
}

class _GridImagesUploadState extends State<GridImagesUpload> {
  @override
  Widget build(BuildContext context) {
    var gridImagesGeneral = GridImagesGeneral(context);
    var currentAreas = gridImagesGeneral.getAreas(widget.message.messageFiles.length);
    return GeneralLayoutGrid(
      areas: currentAreas!,
      secretKey: widget.secretKey,
      message: widget.message,
    );
  }
}

class GeneralLayoutGrid extends GridImagesGeneralProps {
  const GeneralLayoutGrid(
      {super.key,
      required super.message,
      required super.areas,
      required this.secretKey
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
          ImageChatFileUpload(
            message: widget.message,
            secretKey: widget.secretKey,
            index: key,
            size: widget.areas.size[key],
            image: image,
            images: widget.message.messageFiles,
            filePath: image.fileName,
          ).inGridArea("img$key"),
      ],
    );
  }
}
