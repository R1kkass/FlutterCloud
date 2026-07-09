import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/domain/model/request/auth/index.dart';
import 'package:TalkSpace/presentation/viewmodels/user/submit_registration_model_view.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SubmitRegistrationButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> formController;

  const SubmitRegistrationButton({super.key, required this.formKey, required this.formController});

  @override
  State<SubmitRegistrationButton> createState() => _SubmitRegistrationButton();
}

class _SubmitRegistrationButton extends State<SubmitRegistrationButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubmitRegistrationModelView>(builder: (context, viewModel, child) {
      return ElevatedButton(
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
              await viewModel.registration(RegistrationRequest(
                password: widget.formController["password"]!.text,
                email: widget.formController["email"]!.text,
                name: widget.formController["name"]!.text
              ));
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRouter.SUBMIT_KEY_REGISTRATION);
            } catch (e) {
              showUnsuccessToast("Пользователь с такой почтой уже зарегистрирован");
              Navigator.pop(context);
            }
          }
        },
        child: const Text('Подтвердить'),
      );
    });
  }
}
