import 'package:TalkSpace/data/repository/files_grpc.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/get_space_view_model.dart';
import 'package:TalkSpace/services/file_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetSpace extends StatefulWidget {
  const GetSpace({super.key});

  @override
  State<GetSpace> createState() => _GetSpaceState();
}

class _GetSpaceState extends State<GetSpace> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GetSpaceViewModel>(builder: (context, viewModel, child) {
      viewModel.getSpace();
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
              value: viewModel.space.toDouble(),
              onChanged: (e) {},
              min: 0,
              max: 1024*1024*1024,
              inactiveColor: Colors.deepOrange.shade100,
            ),
          ),
          Text(viewModel.text),
        ]));
    });
  }
}
