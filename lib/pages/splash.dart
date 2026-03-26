import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/app/notification_service.dart';
import 'package:TalkSpace/components/default_scaffold.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';

class Splash extends StatefulWidget {
  final String title;

  const Splash({super.key, required this.title});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((e) async {
      // if (context.read<TokenCubit>().state == "") {

      // }

      try {
        await AuthGrpc().refresh();
        await NotificationServices.initializeService();
        Navigator.pushNamedAndRemoveUntil(context, AppRouter.CHAT_LIST, (e) {
          return false;
        });
      } catch (e) {
        Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (e) {
          return false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        title: widget.title,
        body: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
