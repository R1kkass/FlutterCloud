import 'package:TalkSpace/shared/my_input.dart';
import 'package:TalkSpace/widget/user/submit_registration_mail_button/submit_registration_mail_button.dart';
import 'package:flutter/material.dart';

class SendRegistrationMailForm extends StatefulWidget {
  const SendRegistrationMailForm(
      {super.key, required this.formKey, required this.sigUpController});

  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> sigUpController;

  @override
  State<SendRegistrationMailForm> createState() =>
      _SendRegistrationMailFormState();
}

class _SendRegistrationMailFormState extends State<SendRegistrationMailForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyInput(
            icon: Icons.key,
            controller: widget.sigUpController["key"],
            title: "Введите код из письма",
            error: "Пожалуйста, заполните поле"),
        const SizedBox(
          height: 25,
        ),
        SubmitRegistrationMailButton(formKey: widget.formKey, sigUpController: widget.sigUpController)
      ],
    );
  }
}
