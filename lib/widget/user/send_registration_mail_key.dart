import 'dart:async';

import 'package:TalkSpace/cubit/registration_bloc.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:TalkSpace/gen/dart/auth/auth.pb.dart';
import 'package:TalkSpace/services/add_zero.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendRegistrationMailKey extends StatefulWidget {
  const SendRegistrationMailKey({super.key});

  @override
  State<SendRegistrationMailKey> createState() =>
      _SendRegistrationMailKeyState();
}

class _SendRegistrationMailKeyState extends State<SendRegistrationMailKey> {
  var secondsBeforeNewRequest = 60;
  Timer? _timer;
  @override
  void initState() {
    _counterSeconds();
    super.initState();
  }

  void _counterSeconds() {
    secondsBeforeNewRequest = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (e) {
      if (secondsBeforeNewRequest > 0) {
        secondsBeforeNewRequest -= 1;
        setState(() {});
      } else {
        _timer!.cancel();
      }
    });
  }

  void _sendNewKey() async {
    try {
      var data = context.read<RegistrationBloc>().state;

      await AuthGrpc().sendNewMailKeyResponse(SendNewMailKeyRequest(
        email: data.email,
        password: data.password,
      ));

      showToast("Ключ отправлен");
      _counterSeconds();
    } catch (e) {
      showUnsuccessToast("Ошибка отправки ключа");
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDisabled = secondsBeforeNewRequest > 0;
    return TextButton(
      onPressed: isDisabled ? null : _sendNewKey,
      child: Text(isDisabled
          ? "Отправить ключ снова через: ${secondsBeforeNewRequest ~/ 60}:${addZero(secondsBeforeNewRequest % 60)}"
          : "Отправить ключ"),
    );
  }
}
