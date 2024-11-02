import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/count_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountBadge extends StatefulWidget {
  const CountBadge({super.key});

  @override
  State<CountBadge> createState() => _CountBadgeState();
}

class _CountBadgeState extends State<CountBadge> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountBloc, CountState>(builder: (context, state) {
      if (state.count == 0) {
        return const Icon(Icons.message);
      }
      return Badge(
        label: Text('${state.count}'),
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.message),
      );
    });
  }
}
