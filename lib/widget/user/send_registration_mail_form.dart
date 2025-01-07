import 'dart:convert';

import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/components/my_input.dart';
import 'package:TalkSpace/cubit/registration_bloc.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:TalkSpace/grpc/keys_grpc.dart';
import 'package:TalkSpace/proto/auth/auth.pb.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              if (widget.formKey.currentState!.validate()) {
                await _submit();
              }
            },
            child: const Text('Подтвердить'),
          ),
        )
      ],
    );
  }

  Future _submit() async {
    try {
      _submitEmail();
    } catch (e) {
      Navigator.pop(context);
      showToast(context, "Ошибка при подтверждении");
    }
  }

  Future _submitEmail() async {
    showLoaderDialog(context);
    var data = context.read<RegistrationBloc>().state;
    var secretKey = data.secretKey!;

    String key = encrypt(widget.sigUpController["key"]!.text, secretKey);

    var submitResponse = await AuthGrpc().submitEmail(SubmitEmailRequest(
        email: data.email, password: data.password, key: key));
    var accessToken = decrypt(submitResponse.accessToken, secretKey);

    var box = HiveBoxes.token;

    await box.put('access_token', accessToken);
    await HiveBoxes.listToken.put(data.email, accessToken);

    List<int> bytes = utf8.encode(data.password!);
    String hash = sha256.convert(bytes).toString();
    await box.put('password', hash.substring(0, 32));

    await KeysGrpc().getKeys();
    context.read<TokenCubit>().updateToken(accessToken);

    await AuthGrpc().createCryptKey(submitResponse.cryptToken, secretKey);

    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
  }
}
