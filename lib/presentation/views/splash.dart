import 'package:TalkSpace/domain/exceptions/refresh_token_exception.dart';
import 'package:TalkSpace/presentation/viewmodels/user/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:provider/provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      await retry();
    });
  }

  retry() async {
    var provider = Provider.of<SplashViewModel>(context, listen: false);
    try {
      await provider.refreshToken();
      Navigator.pushNamedAndRemoveUntil(context, AppRouter.CHAT_LIST, (e) {
        return false;
      });
    } on RefreshTokenException catch (refreshErr) {
      Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (e) {
        return false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashViewModel>(builder: (context, viewModel, child) {
      return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: viewModel.isError ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 70),
            TextButton(
              onPressed: retry,
              child: const Text("Повторить", style: TextStyle(fontSize: 18),),
            ),
          ],
        ) : const CircularProgressIndicator(),
      );
    });
  }
}
