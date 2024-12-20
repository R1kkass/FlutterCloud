import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/grid_images_general.dart';
import 'package:flutter_application_2/entities/chat/image_chat_file_upload.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GridImagesUpload extends StatefulWidget {
  const GridImagesUpload(
      {super.key, required this.images, required this.messageId});

  final List<ChatFile> images;
  final int messageId;

  @override
  State<GridImagesUpload> createState() => _GridImagesUploadState();
}

class _GridImagesUploadState extends State<GridImagesUpload> {
  @override
  Widget build(BuildContext context) {
    var gridImagesGeneral = GridImagesGeneral(context);
    var currentAreas = gridImagesGeneral.getAreas(widget.images.length);
    return GeneralLayoutGrid(
      images: widget.images,
      areas: currentAreas!,
      messageId: widget.messageId,
    );
  }
}

class GeneralLayoutGrid extends GridImagesGeneralProps {
  GeneralLayoutGrid(
      {super.key,
      required super.images,
      required super.areas,
      required this.messageId});

  final int messageId;
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
        for (var (key, image) in widget.images.indexed)
          ImageChatFileUpload(
            messageId: widget.messageId,
            index: key,
            size: widget.areas.size[key],
            image: image,
            images: widget.images,
            filePath: image.fileName,
          ).inGridArea("img$key"),
      ],
    );
  }
}
