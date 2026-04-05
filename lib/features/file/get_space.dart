import 'package:TalkSpace/data/repository/files_grpc.dart';
import 'package:TalkSpace/services/file_size.dart';
import 'package:flutter/material.dart';

class GetSpace extends StatefulWidget {
  const GetSpace({super.key});

  @override
  State<GetSpace> createState() => _GetSpaceState();
}

class _GetSpaceState extends State<GetSpace> {
  String text = "Загрузка...";
  int space = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    try {
      var getSpace = await FilesGrpc().getSpace();
      setState(() {
        space = getSpace.space;
        text = "Занято: ${fileSize(getSpace.space)} из 1 Гб";
      });
    } catch (e) {
      setState(() {
        text = "Ошибка";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Column(children: [
          const Icon(Icons.cloud_outlined),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                thumbColor: Colors.transparent,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
            child: Slider(
              value: space.toDouble(),
              onChanged: (e) {},
              min: 0,
              max: 536870912 * 2,
              inactiveColor: Colors.deepOrange.shade100,
            ),
          ),
          Text(text),
        ]));
  }
}
