import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/components/default_scaffold.dart';
import 'package:TalkSpace/data/repository/auth_grpc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  final String title;

  const Splash({super.key, required this.title});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isError = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((e) async {
      await _retry();
    });
  }

  _retry() async {
    if (HiveBoxes.token.get("access_token") == null || HiveBoxes.listToken.get(jwtDecode().email) == null) {
      Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (e) {
        return false;
      });
      return;
    }

    if (context.read<TokenCubit>().state == null) {
      try {
        setState(() {
          isError = false;
        });
        await AuthGrpc().refresh();
        Navigator.pushNamedAndRemoveUntil(context, AppRouter.CHAT_LIST, (e) {
          return false;
        });
      } catch (e) {
        setState(() {
          isError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      body: Center(
        child: isError ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 70),
            TextButton(
              onPressed: _retry,
              child: const Text("Повторить", style: TextStyle(fontSize: 18),),
            )
          ],
        ) : const CircularProgressIndicator(),
      ));
  }
}
