import 'package:TalkSpace/presentation/viewmodels/messenger/count_badge_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountBadge extends StatefulWidget {
  const CountBadge({super.key});

  @override
  State<CountBadge> createState() => _CountBadgeState();
}

class _CountBadgeState extends State<CountBadge> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountBadgeViewModel>(builder: (context, viewModel, state) {
      if (viewModel.countNotReadingChats == 0) {
        return const Icon(Icons.message);
      }
      return Badge(
        label: Text('${viewModel.countNotReadingChats}'),
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.message),
      );
    });
  }
}
