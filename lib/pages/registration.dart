import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/auth_api.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/components/my_input.dart';
import 'package:flutter_application_2/components/toast.dart';
import 'package:flutter_application_2/consts/links.dart';

class Registration extends StatefulWidget {
  final String title;
  const Registration({super.key, required this.title});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> sigUpController = {
    'email': TextEditingController(),
    'name': TextEditingController(),
    'password': TextEditingController(),
    'repeat_password': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 48.0, right: 48.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              const Text(
                'Регистрация',
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
                        icon: Icons.face,
                        controller: sigUpController["name"],
                        title: "Введите имя",
                        error: "Пожалуйста, заполните поле имя"),
                    const SizedBox(
                      height: 10,
                    ),
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
                      height: 10,
                    ),
                    MyInput(
                        icon: Icons.key,
                        obscureText: true,
                        controller: sigUpController["repeat_password"],
                        title: "Повторите пароль",
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            registration(RegisterParams(
                                    sigUpController["email"]?.text,
                                    sigUpController["password"]?.text,
                                    sigUpController["name"]?.text))
                                .then((e) => {
                                      e.statusCode == 201
                                          ? Navigator.pushNamed(context, AUTH)
                                          : showToast(
                                              context, "Ошибка при регистрации")
                                    });
                          }
                        },
                        child: const Text('Подтвердить'),
                      ),
                    ),
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
