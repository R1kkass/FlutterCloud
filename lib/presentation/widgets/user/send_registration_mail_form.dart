import 'package:TalkSpace/presentation/widgets/user/send_registration_mail_key.dart';
import 'package:TalkSpace/shared/my_input.dart';
import 'package:TalkSpace/presentation/widgets/user/submit_registration_mail_button.dart';
import 'package:flutter/material.dart';

class SendRegistrationMailForm extends StatefulWidget {
  const SendRegistrationMailForm({super.key});


  @override
  State<SendRegistrationMailForm> createState() =>
      _SendRegistrationMailFormState();
}

class _SendRegistrationMailFormState extends State<SendRegistrationMailForm> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final Map<String, TextEditingController> sigUpController = {
      'key': TextEditingController(),
    };
    return
      Form(
        key: _formKey,
        child: Column(
          children: [
            MyInput(
                icon: Icons.key,
                controller: sigUpController["key"],
                title: "Введите код из письма",
                error: "Пожалуйста, заполните поле"),
            const SizedBox(
              height: 25,
            ),
            SubmitRegistrationMailButton(formKey: _formKey, sigUpController: sigUpController),
            SendRegistrationMailKey()
          ],
        )
      );
  }
}
