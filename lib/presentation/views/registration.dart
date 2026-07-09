import 'package:TalkSpace/domain/model/request/auth/index.dart';
import 'package:TalkSpace/presentation/widgets/user/submit_registration_button.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/shared/my_input.dart';
import 'package:TalkSpace/shared/form_layout.dart';

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
    return FormLayout(
        title: "Регистрация",
        child: Form(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Пожалуйста, заполните поле пароль";
                  }
                  if (sigUpController["password"]!.text != value) {
                    return "Пароли не совпадают";
                  }
                  return null;
                },
                title: "Повторите пароль",
                error: "Пожалуйста, заполните поле пароль"
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SubmitRegistrationButton(formKey: _formKey,
                  formController: sigUpController
                )
              ),
            ],
          ),
        ));
  }
}
