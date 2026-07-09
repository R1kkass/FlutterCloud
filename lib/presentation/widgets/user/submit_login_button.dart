import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/domain/model/request/auth/index.dart';
import 'package:TalkSpace/presentation/viewmodels/user/submit_login_view_model.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmitLoginButton extends StatefulWidget {
  const SubmitLoginButton(
      {super.key, required this.formKey, required this.formController});

  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> formController;
  @override
  State<SubmitLoginButton> createState() => _SubmitLoginButtonState();
}

class _SubmitLoginButtonState extends State<SubmitLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubmitLoginViewModel>(builder: (context, viewModel, child) {
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
              try {
                showLoaderDialog(context);
                await viewModel.login(LoginRequest(email: widget.formController['email']!.text, password: widget.formController['password']!.text));
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, AppRouter.CHAT_LIST, (e) {
                  return false;
                });
              } catch (e) {
                showUnsuccessToast("Неверный логин или пароль");
                Navigator.pop(context);
              }
            }
          },
          child: const Text('Подтвердить'),
        ),
      );
    });
  }
}
