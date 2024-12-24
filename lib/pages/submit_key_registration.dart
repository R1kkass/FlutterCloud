import 'dart:convert';

import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/widget/user/send_registration_mail_key.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/components/my_input.dart';
import 'package:TalkSpace/cubit/registration_bloc.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:TalkSpace/grpc/keys_grpc.dart';
import 'package:TalkSpace/proto/auth/auth.pb.dart';
import 'package:TalkSpace/proto/keys/keys.pb.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/shared/form_layout.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitKeyRegistration extends StatefulWidget {
  const SubmitKeyRegistration({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SubmitKeyRegistration> createState() => _SubmitKeyregistrationState();
}

class _SubmitKeyregistrationState extends State<SubmitKeyRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> sigUpController = {
    'key': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return FormLayout(
        title: widget.title,
        child: Form(
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
                      _submitEmail().then((e) {
                        if (e != null) {
                          context.read<TokenCubit>().updateToken(e.accessToken);
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (r) => false);
                        }
                      });
                      return;
                    }
                  },
                  child: const Text('Подтвердить'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SendRegistrationMailKey()
            ],
          ),
        ));
  }

  Future<SubmitEmailResponse?> _submitEmail() async {
    try {
      showLoaderDialog(context);
      var data = context.read<RegistrationBloc>().state;
      String key = encrypt(sigUpController["key"]!.text, data.secretKey!);

      var submitResponse = await AuthGrpc().submitEmail(SubmitEmailRequest(
          email: data.email, password: data.password, key: key));
      var token = decrypt(submitResponse.accessToken, data.secretKey!);
      KeysGrpc().uploadFile(KeysUploadRequest());

      var box = Hive.box('token');
      var boxTokens = Hive.box('list_token');

      await box.put('access_token', token);
      await boxTokens.put(data.email, token);

      List<int> bytes = utf8.encode(data.password!);
      String hash = sha256.convert(bytes).toString();
      await box.put('password', hash.substring(0, 32));
      return SubmitEmailResponse(accessToken: token);
    } catch (e) {
      showToast(context, "Ошибка при подтверждении");
      return null;
    } finally {
      Navigator.pop(context);
    }
  }
}
