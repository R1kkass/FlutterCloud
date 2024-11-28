import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/chat/image_chat_file.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GridImages extends StatefulWidget {
  const GridImages({super.key, required this.secretKey, required this.images});

  final List<ChatFile> images;
  final String secretKey;

  @override
  State<GridImages> createState() => _GridImagesState();
}

class Areas {
  const Areas(
      {required this.countColumns,
      required this.countRows,
      required this.areas});
  final int countColumns;
  final int countRows;
  final String areas;
}

class _GridImagesState extends State<GridImages> {
  var areas = {
    1: const Areas(areas: '''
          img0
        ''', countColumns: 1, countRows: 1),
    2: const Areas(areas: '''
          img0 img1
        ''', countColumns: 2, countRows: 1),
    3: const Areas(areas: '''
          img0 img0 img1
          img0 img0 img2
        ''', countColumns: 3, countRows: 2),
    4: const Areas(areas: '''
          img0 img1
          img2 img3
        ''', countColumns: 2, countRows: 2),
    5: const Areas(areas: '''
          img0 img0 img0 img1 img1 img1
          img2 img2 img3 img3 img4 img4
        ''', countColumns: 6, countRows: 2),
    6: const Areas(areas: '''
          img0 img1 img2
          img3 img4 img5
        ''', countColumns: 3, countRows: 2),
    7: const Areas(areas: '''
          img0 img0 img0 img1 img1 img1
          img2 img2 img2 img3 img3 img3
          img4 img4 img5 img5 img6 img6
        ''', countColumns: 6, countRows: 3),
    8: const Areas(areas: '''
          img0 img0 img0 img1 img1 img1
          img2 img2 img3 img3 img4 img4
          img5 img5 img6 img6 img7 img7
        ''', countColumns: 6, countRows: 3),
    9: const Areas(areas: '''
          img0 img1 img2
          img3 img4 img5
          img6 img7 img8
        ''', countColumns: 3, countRows: 3),
    10: const Areas(areas: '''
          img0 img0 img0 img1 img1 img1
          img2 img2 img2 img3 img3 img3
          img4 img4 img5 img5 img6 img6
          img7 img7 img8 img8 img9 img9
        ''', countColumns: 6, countRows: 3),
  };

  @override
  Widget build(BuildContext context) {
    var currentAreas = areas[widget.images.length];
    return GeneralLayoutGrid(
        secretKey: widget.secretKey,
        images: widget.images,
        areas: currentAreas!);
  }
}

class GeneralLayoutGrid extends StatefulWidget {
  const GeneralLayoutGrid(
      {super.key,
      required this.secretKey,
      required this.images,
      required this.areas});

  final List<ChatFile> images;
  final String secretKey;
  final Areas areas;
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
      columnSizes: List<TrackSize>.filled(widget.areas.countColumns, auto),
      rowSizes: List<TrackSize>.filled(widget.areas.countRows, auto),
      children: [
        for (var (key, image) in widget.images.indexed)
          ImageChatFile(
            index: key,
            secretKey: widget.secretKey,
            image: image,
            images: widget.images,
            fileName:
                EncryptMessage().decrypt(image.fileName, widget.secretKey),
          ).inGridArea("img$key"),
      ],
    );
  }
}
