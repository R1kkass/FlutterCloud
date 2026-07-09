import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/image_chat_file.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/message_file_default_provider.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/gallery/grid_images_general.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GridImages extends StatefulWidget {
  const GridImages({super.key, required this.message, required this.images});

  final List<MessageFile> images;
  final Message message;

  @override
  State<GridImages> createState() => _GridImagesState();
}

class _GridImagesState extends State<GridImages> {
  @override
  Widget build(BuildContext context) {
    var gridImagesGeneral = GridImagesGeneral(context);
    var currentAreas = gridImagesGeneral.getAreas(widget.images.length);
    return LayoutGrid(
      areas: currentAreas.areas,
      rowGap: 0,
      columnGap: 0,
      columnSizes: currentAreas.columnSizes,
      rowSizes: currentAreas.rowsSizesTrackSize,
      children: [
        for (var (key, image) in widget.images.indexed)
        MessageFileDefaultProvider(
          messageFile: image,
          child: ImageChatFile(
              index: key,
              size: currentAreas.size[key],
              message: widget.message,
            ).inGridArea("img$key")
        ),
      ],
    );
  }
}
