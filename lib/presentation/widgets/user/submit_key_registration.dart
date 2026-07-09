import 'package:TalkSpace/presentation/viewmodels/user/submit_registration_mail_button_view_model.dart';
import 'package:TalkSpace/presentation/widgets/user/send_registration_mail_form.dart';
import 'package:TalkSpace/presentation/widgets/user/send_registration_mail_key.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/shared/my_input.dart';
import 'package:TalkSpace/shared/form_layout.dart';
import 'package:provider/provider.dart';

class SubmitKeyRegistration extends StatelessWidget {
  const SubmitKeyRegistration({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return FormLayout(
        title: title,
        child: SendRegistrationMailForm()
    );
  }
}
