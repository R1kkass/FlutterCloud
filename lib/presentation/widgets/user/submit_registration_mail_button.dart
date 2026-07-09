import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/presentation/viewmodels/user/submit_registration_mail_button_view_model.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmitRegistrationMailButton extends StatefulWidget {
  const SubmitRegistrationMailButton(
      {super.key, required this.formKey, required this.sigUpController});

  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> sigUpController;
  @override
  State<SubmitRegistrationMailButton> createState() => _SubmitRegistrationMailButtonState();
}

class _SubmitRegistrationMailButtonState extends State<SubmitRegistrationMailButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubmitRegistrationMailButtonViewModel>(builder: (context, viewModel, child) {
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
            try {
              if (widget.formKey.currentState!.validate()) {
                showLoaderDialog(context);
                String key = widget.sigUpController["key"]!.text;
                await viewModel.submit(key);
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, AppRouter.SPLASH, (r) => false);
              }
            } catch (e) {
              Navigator.pop(context);
              showUnsuccessToast("Ошибка при подтверждении");
            }
          },
          child: const Text('Подтвердить'),
        ),
      );
    });
  }
}
