import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/gen/dart/auth/auth.pb.dart';
import 'package:TalkSpace/data/repository/auth_grpc.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';

class SubmitLoginButton extends StatefulWidget {
  const SubmitLoginButton(
      {super.key, required this.formKey, required this.sigUpController});

  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> sigUpController;
  @override
  State<SubmitLoginButton> createState() => _SubmitLoginButtonState();
}

class _SubmitLoginButtonState extends State<SubmitLoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(5.0),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.0),
            ))),
        onPressed: () async {
          if (widget.formKey.currentState!.validate()) {
            await _login();
          }
        },
        child: const Text('Подтвердить'),
      ),
    );
  }

  Future _login() async {
    try {
      await _loginForm();
    } catch (e) {
      showUnsuccessToast("Неверный логин или пароль");
      Navigator.pop(context);
    }
  }

  Future _loginForm() async {
    showLoaderDialog(context);
    var email = widget.sigUpController["email"]!.text;
    var password = widget.sigUpController["password"]!.text;

    await AuthGrpc().login(LoginRequest(
      email: email,
      password: password
    ));
    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, AppRouter.CHAT_LIST, (e) {
      return false;
    });
  }
}
