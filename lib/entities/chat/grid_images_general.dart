import 'package:flutter/material.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class Areas {
  const Areas(
      {required this.countColumns,
      required this.countRows,
      required this.columnSizes,
      required this.rowsSizesTrackSize,
      required this.size,
      required this.areas});
  final int countColumns;
  final int countRows;
  final List<TrackSize> columnSizes;
  final List<TrackSize> rowsSizesTrackSize;
  final List<double> size;
  final String areas;
}

class GridImagesGeneral {
  final BuildContext context;

  GridImagesGeneral(this.context);

  List<TrackSize> defaultColumnSize(int countcolumn) {
    return List<TrackSize>.filled(
        countcolumn,
        (MediaQuery.of(context).size.width / countcolumn - 70 / countcolumn)
            .px);
  }

  List<TrackSize> defaultRowSizeTrackSize(int countRows, int countColumn) {
    return List<TrackSize>.filled(
        countRows, (MediaQuery.of(context).size.width / countColumn).px);
  }

  List<double> defaultRowSize(int countRows, int countColumn) {
    return List<double>.filled(countRows * countColumn,
        (MediaQuery.of(context).size.width / countColumn));
  }

  getAreas(int countImages) {
    var areas = {
      1: Areas(
          areas: '''
          img0
        ''',
          countColumns: 1,
          countRows: 1,
          size: defaultRowSize(1, 1),
          columnSizes: defaultColumnSize(1),
          rowsSizesTrackSize: defaultRowSizeTrackSize(1, 1)),
      2: Areas(
          areas: '''
          img0 img1
        ''',
          countColumns: 2,
          countRows: 1,
          columnSizes: defaultColumnSize(2),
          size: defaultRowSize(1, 2),
          rowsSizesTrackSize: defaultRowSizeTrackSize(1, 2)),
      3: Areas(
          areas: '''
          img0 img0 img1
          img0 img0 img2
        ''',
          countColumns: 3,
          countRows: 2,
          size: [
            MediaQuery.of(context).size.width / 1,
            (MediaQuery.of(context).size.width / 3),
            (MediaQuery.of(context).size.width / 3),
          ],
          columnSizes: [
            (MediaQuery.of(context).size.width / 4 - 0).px,
            (MediaQuery.of(context).size.width / 4 - 1.8).px,
            (MediaQuery.of(context).size.width / 2).px,
          ],
          rowsSizesTrackSize: defaultRowSizeTrackSize(2, 3)),
      4: Areas(
          areas: '''
          img0 img1
          img2 img3
        ''',
          countColumns: 2,
          countRows: 2,
          size: defaultRowSize(2, 2),
          columnSizes: defaultColumnSize(2),
          rowsSizesTrackSize: defaultRowSizeTrackSize(2, 2)),
      5: Areas(
          areas: '''
          img0 img0 img0 img1 img1 img1
          img2 img2 img3 img3 img4 img4
        ''',
          countColumns: 6,
          countRows: 2,
          size: [
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
          ],
          columnSizes: defaultColumnSize(6),
          rowsSizesTrackSize: [
            (MediaQuery.of(context).size.width / 2).px,
            (MediaQuery.of(context).size.width / 3 - 2.28).px,
          ]),
      6: Areas(
          areas: '''
          img0 img1 img2
          img3 img4 img5
        ''',
          countColumns: 3,
          countRows: 2,
          size: defaultRowSize(2, 3),
          columnSizes: defaultColumnSize(3),
          rowsSizesTrackSize: defaultRowSizeTrackSize(2, 3)),
      7: Areas(
          areas: '''
          img0 img0 img0 img1 img1 img1
          img2 img2 img2 img3 img3 img3
          img4 img4 img5 img5 img6 img6
        ''',
          countColumns: 6,
          countRows: 3,
          size: [
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
          ],
          columnSizes: defaultColumnSize(6),
          rowsSizesTrackSize: [
            (MediaQuery.of(context).size.width / 2).px,
            (MediaQuery.of(context).size.width / 2).px,
            (MediaQuery.of(context).size.width / 3 - 2.28).px,
          ]),
      8: Areas(
          areas: '''
          img0 img0 img0 img1 img1 img1
          img2 img2 img3 img3 img4 img4
          img5 img5 img6 img6 img7 img7
        ''',
          countColumns: 6,
          countRows: 3,
          size: defaultRowSize(3, 6),
          columnSizes: defaultColumnSize(6),
          rowsSizesTrackSize: defaultRowSizeTrackSize(3, 6)),
      9: Areas(
          areas: '''
          img0 img1 img2
          img3 img4 img5
          img6 img7 img8
        ''',
          countColumns: 3,
          countRows: 3,
          size: defaultRowSize(3, 3),
          columnSizes: defaultColumnSize(3),
          rowsSizesTrackSize: defaultRowSizeTrackSize(3, 3)),
      10: Areas(
          areas: '''
          img0 img0 img0 img1 img1 img1
          img2 img2 img2 img3 img3 img3
          img4 img4 img5 img5 img6 img6
          img7 img7 img8 img8 img9 img9
        ''',
          countColumns: 6,
          countRows: 4,
          size: [
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 2),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
            (MediaQuery.of(context).size.width / 3 - 2.28),
          ],
          columnSizes: defaultColumnSize(6),
          rowsSizesTrackSize: [
            (MediaQuery.of(context).size.width / 2).px,
            (MediaQuery.of(context).size.width / 2).px,
            (MediaQuery.of(context).size.width / 3 - 2.28).px,
            (MediaQuery.of(context).size.width / 3 - 2.28).px,
          ]),
    };
    return areas[countImages];
  }
}

abstract class GridImagesGeneralProps extends StatefulWidget {
  const GridImagesGeneralProps(
      {required this.images, required this.areas, super.key});

  final List<ChatFile> images;
  final Areas areas;
}
