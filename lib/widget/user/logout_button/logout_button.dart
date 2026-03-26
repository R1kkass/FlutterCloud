import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          var session = HiveBoxes.listToken.get(jwtDecode().email);
          if (session != null) {
            await AuthGrpc().logout(jwtDecode().email, session);
            context.read<TokenCubit>().updateToken("");
            HiveBoxes.token.clear();
          }
          Navigator.pushNamed(context, AppRouter.AUTH);
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.exit_to_app_outlined),
            SizedBox(
              width: 5,
            ),
            Text(
              "Выход",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ));
  }
}
