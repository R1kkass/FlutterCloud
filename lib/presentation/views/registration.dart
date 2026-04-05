import 'package:flutter/material.dart';
import 'package:TalkSpace/shared/my_input.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/data/repository/auth_grpc.dart';
import 'package:TalkSpace/gen/dart/auth/auth.pb.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/cubit/registration_bloc.dart';
import 'package:TalkSpace/shared/form_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registration extends StatefulWidget {
  final String title;
  const Registration({super.key, required this.title});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _authGrpc = AuthGrpc();

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
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _registration();
                    }
                  },
                  child: const Text('Подтвердить'),
                ),
              ),
            ],
          ),
        ));
  }

  Future _registration() async {
    try {
      await _registrationForm();
    } catch (e) {
      showUnsuccessToast("Пользователь с такой почтой уже зарегистрирован");
      Navigator.pop(context);
    }
    return null;
  }

  Future _registrationForm() async {
    showLoaderDialog(context);

    var email = sigUpController["email"]!.text;
    var password = sigUpController["password"]!.text;
    var name = sigUpController["name"]!.text;

    await _authGrpc.registration(
        RegistrationRequest(email: email, password: password, name: name));
    context
        .read<RegistrationBloc>()
        .add(AddFields(email: email, password: password));
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRouter.SUBMIT_KEY_REGISTRATION);
  }
}
