import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/cubit/current_page_bloc.dart';
import 'package:flutter_application_2/entities/chat/count_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    var objectNavigation = {
      0: () => Navigator.of(context).popAndPushNamed(AppRouter.HOME),
      1: () => Navigator.of(context).popAndPushNamed(AppRouter.CHAT_LIST)
    };
    return BottomNavigationBar(
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud),
          label: 'Облако',
        ),
        BottomNavigationBarItem(
          icon: CountBadge(),
          label: 'Сообщения',
        ),
      ],
      currentIndex: context.read<CurrentPageBloc>().state.page,
      onTap: (v) {
        setState(() {
          context.read<CurrentPageBloc>().add(ChangePage(v));
          objectNavigation[v]!();
        });
      },
    );
  }
}
