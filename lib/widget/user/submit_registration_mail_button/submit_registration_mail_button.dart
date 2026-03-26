import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/cubit/registration_bloc.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:TalkSpace/widget/user/submit_registration_mail_button/model/submit_mail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            await _submit();
          }
        },
        child: const Text('Подтвердить'),
      ),
    );
  }


  Future _submit() async {
    try {
      await _submitEmail();
    } catch (e) {
      Navigator.pop(context);
      showUnsuccessToast("Ошибка при подтверждении");
    }
  }

  Future _submitEmail() async {
    showLoaderDialog(context);
    var data = context.read<RegistrationBloc>().state;
    if (data.password.runtimeType != String || data.email.runtimeType != String || data.runtimeType != String) {
      throw Exception("State RegistrationBloc is empty");
    }

    var secretKey = data.secretKey!;

    String key = encrypt(widget.sigUpController["key"]!.text, secretKey);

    String accessToken = await SubmitMail().submit(data.email!, data.password!, key, secretKey);
    context.read<TokenCubit>().updateToken(accessToken);

    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
  }
}
