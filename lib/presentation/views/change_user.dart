import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/components/default_scaffold.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeUser extends StatefulWidget {
  final String title;
  const ChangeUser({super.key, required this.title});

  @override
  State<ChangeUser> createState() => _ChangeUserState();
}

class _ChangeUserState extends State<ChangeUser> {
  @override
  Widget build(BuildContext context) {
    var tokenKeys = HiveBoxes.listToken.keys.toList();
    var tokens = HiveBoxes.listToken.values.toList();
    return DefaultScaffold(
      title: widget.title,
      body: ListView.builder(
          itemCount: tokenKeys.length,
          itemBuilder: (context, index) {
            var token = context.read<TokenCubit>().state;
            if (tokens[index] != token) {
              return TextButton(
                onPressed: () {
                    changeToken(context, tokens[index].refreshToken, tokenKeys[index]);
                  },
                  child: Text(tokenKeys[index]));
            }
            return const SizedBox(height: 0);
          }),
    );
  }
}

void changeToken(BuildContext context, String token, String name) {
  HiveBoxes.token.put('access_token', token);
  context.read<TokenCubit>().updateToken(token);
  Navigator.pushNamedAndRemoveUntil(context, AppRouter.SPLASH, (r) => false);
  showToast('Аккаунт сменен на: $name');
}
