import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeUser extends StatefulWidget {
  final String title;
  const ChangeUser({super.key, required this.title});

  @override
  State<ChangeUser> createState() => _ChangeUserState();
}

class _ChangeUserState extends State<ChangeUser> {
  var box = Hive.box('list_token');

  @override
  Widget build(BuildContext context) {
    var tokenKeys = box.keys.toList();
    var tokens = box.values.toList();
    return DefaultScaffold(
      title: widget.title,
      body: ListView.builder(
          itemCount: tokenKeys.length,
          itemBuilder: (context, index) {
            var token = context.read<TokenCubit>().state;
            if (tokens[index] != token) {
              return TextButton(
                  onPressed: () {
                    changeToken(context, tokens[index], tokenKeys[index]);
                  },
                  child: Text(tokenKeys[index]));
            }
            return const SizedBox(height: 0);
          }),
    );
  }
}

void changeToken(BuildContext context, String token, String name) {
  var box = Hive.box('token');
  box.put('access_token', token);
  context.read<TokenCubit>().updateToken(token);
  Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
  showToast(context, 'Аккаунт сменен на: $name');
}
