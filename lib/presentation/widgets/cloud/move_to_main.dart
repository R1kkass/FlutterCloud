import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/move_to_main_view_model.dart';
import 'package:TalkSpace/presentation/widgets/cloud/cloud_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoveToMain extends StatefulWidget {
  final Folder? folder;

  const MoveToMain({
    super.key,
    required this.folder
  });

  @override
  State<MoveToMain> createState() => _MoveToMainState();
}

class _MoveToMainState extends State<MoveToMain> {
  @override
  Widget build(BuildContext context) {

    return Consumer<MoveToMainViewModel>(builder: (context, viewModel, child) {
      return DragTarget<DragFields>(onWillAcceptWithDetails: (details) {
        return true;
      }, onAcceptWithDetails: (details) async {
       await viewModel.move(details.data, widget.folder?.id);
      }, builder: (context, candidateItems, rejectedItems) {
        return SizedBox(
          height: 60,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    candidateItems.isNotEmpty
                        ? Colors.deepOrange.shade100
                        : Colors.white)),
            child: const Text("Переместить на главную"),
          ));
      });
    });
  }
}
