import 'package:TalkSpace/widget/user/submit_login_button.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/components/my_input.dart';
import 'package:TalkSpace/shared/form_layout.dart';

class Authorization extends StatefulWidget {
  final String title;
  const Authorization({super.key, required this.title});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class LoginFields {
  final String email;
  final String password;

  const LoginFields({required this.email, required this.password});
}

class _AuthorizationState extends State<Authorization> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> sigUpController = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return FormLayout(
        title: widget.title,
        child: Form(
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
              SubmitLoginButton(
                formKey: _formKey,
                sigUpController: sigUpController,
              ),
              Center(
                  child: TextButton(
                child: const Text("Регистрация"),
                onPressed: () async {
                  Navigator.pushNamed(context, AppRouter.REGISTRATION);
                },
              ))
            ],
          ),
        ));
  }
}
