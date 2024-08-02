import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/auth_api.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/components/my_input.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Authorization extends StatefulWidget {
  final String title;
  const Authorization({super.key, required this.title});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> sigUpController = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Авторизация',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyInput(
                        icon: Icons.mail,
                        controller: sigUpController["email"],
                        title: "Введите E-Mail",
                        error: "Пожалуйста, заполните поле E-Mail"),
                    const SizedBox(
                      height: 10,
                    ),
                    MyInput(
                        icon: Icons.key,
                        controller: sigUpController["password"],
                        title: "Введите пароль",
                        obscureText: true,
                        error: "Пожалуйста, заполните поле пароль"),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: WidgetStateProperty.all(5.0),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var box = await Hive.openBox('token');

                            login(AuthParams(sigUpController["email"]?.text,
                                    sigUpController["password"]?.text))
                                .then((e) => {
                                      box.put('access_token',
                                          json.decode(e.body)["access_token"]),
                                      context.read<TokenCubit>().updateToken(
                                          json.decode(e.body)["access_token"]),
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/', (r) => false)
                                    });
                            return;
                          }
                        },
                        child: const Text('Подтвердить'),
                      ),
                    ),
                    Center(
                        child: TextButton(
                      child: const Text("Регистрация"),
                      onPressed: () async {
                        Navigator.pushNamed(context, REGISTRATION);
                      },
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
