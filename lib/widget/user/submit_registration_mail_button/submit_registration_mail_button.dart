import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/cubit/registration_bloc.dart';
import 'package:TalkSpace/gen/dart/auth/auth.pb.dart';
import 'package:TalkSpace/data/repository/auth_grpc.dart';
import 'package:TalkSpace/shared/toast.dart';
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
    String key = widget.sigUpController["key"]!.text;
    await AuthGrpc().submitEmail(SubmitEmailRequest(
        email: data.email, password: data.password, key: key));

    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, AppRouter.SPLASH, (r) => false);
  }
}
