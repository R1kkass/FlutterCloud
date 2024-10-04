import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/bottom_sheeet.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/futureBuilders/folder_builder.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeArgs {
  int? id = 0;
  String? title;
  HomeArgs(this.id, this.title);
}

class Home extends StatefulWidget with RouteAware {
  final String title;
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with RouteAware {
  Map<String, dynamic> folders = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    if (ModalRoute.of(context)!.settings.name == "/") {
      final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;
      context.read<FolderCubit>().updateDataFetch(args?.id, context);
    }
  }

  @override
  void didPush() {
    if (ModalRoute.of(context)!.settings.name == "/") {
      final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;
      context.read<FolderCubit>().updateDataFetch(args?.id, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeArgs?;

    return DefaultScaffold(
        title: (args?.title.runtimeType == String)
            ? (args as HomeArgs).title.toString()
            : widget.title,
        body: const FolderBuilder(),
        floatButton: BottomSheetExample(id: args?.id));
  }
}
