import 'package:TalkSpace/presentation/viewmodels/user/index.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendRegistrationMailKey extends StatefulWidget {
  const SendRegistrationMailKey({super.key});

  @override
  State<SendRegistrationMailKey> createState() =>
      _SendRegistrationMailKeyState();
}

class _SendRegistrationMailKeyState extends State<SendRegistrationMailKey> {

  @override
  void initState() {
    super.initState();
    Provider.of<SubmitRegistrationMailButtonViewModel>(context, listen: false).counterSeconds();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubmitRegistrationMailButtonViewModel>(builder: (context, viewModel, child) {
      void sendNewKey() async {
        try {
          await viewModel.sendNewKey();
          showToast("Ключ отправлен");
        } catch (e) {
          showUnsuccessToast("Ошибка отправки ключа");
        }
      }

      var isDisabled = viewModel.secondsBeforeNewRequest > 0;
      return TextButton(
        onPressed: isDisabled ? null : sendNewKey,
        child: Text(isDisabled
            ? "Отправить ключ снова через: ${viewModel.secondsBeforeNewRequest ~/ 60}:${addZero(viewModel.secondsBeforeNewRequest % 60)}"
            : "Отправить ключ"),
      );
    });
  }
}
