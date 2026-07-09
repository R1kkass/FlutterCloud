import 'package:TalkSpace/presentation/views/cloud.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/presentation/widgets/scaffold/count_badge.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    AppRouter.CHAT_LIST;
    var objectNavigation = {
      0: () => Navigator.of(context).popAndPushNamed(AppRouter.CHAT_LIST),
      1: () => Navigator.of(context).popAndPushNamed(AppRouter.CLOUD, arguments: CloudArgs(null)),
    };
    Map<String, int> objectNavigationIndex = {
      AppRouter.CHAT_LIST: 0,
      AppRouter.CLOUD: 1,
    };

    return BottomNavigationBar(
      enableFeedback: false,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: CountBadge(),
          label: 'Сообщения',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud),
          label: 'Облако',
        ),
      ],
      currentIndex: objectNavigationIndex[ModalRoute.of(context)?.settings.name]!,
      onTap: (v) {
        setState(() {
          objectNavigation[v]!();
        });
      },
    );
  }
}
