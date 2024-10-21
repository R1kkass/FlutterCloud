import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/app/notification_service.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/grpc/auth_grpc.dart';

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
      await AuthGrpc().checkAuth().catchError((e) {
        Navigator.pushNamed(context, AppRouter.AUTH);
        return e;
      });
      try {
        await NotificationServices.initializeService();
        Navigator.pushNamedAndRemoveUntil(context, AppRouter.HOME, (e) {
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
