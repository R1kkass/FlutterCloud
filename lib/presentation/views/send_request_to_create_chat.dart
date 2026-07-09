import 'package:TalkSpace/presentation/viewmodels/messenger/chat/index.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/scaffold/default_scaffold.dart';
import 'package:TalkSpace/shared/my_input.dart';
import 'package:provider/provider.dart';

class SendRequestToCreateChat extends StatefulWidget {
  final String title;

  const SendRequestToCreateChat({super.key, required this.title});

  @override
  State<SendRequestToCreateChat> createState() => _SendRequestToCreateChatState();
}

class _SendRequestToCreateChatState extends State<SendRequestToCreateChat> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SendRequestToCreateChatViewModel>(builder: (context, viewModel, child) {
      getUserFetch(String companionUUID) async {
        try {
          await viewModel.createChat(companionUUID);
          showSuccessToast("Заявка отправлена");
        } catch (e) {
          showUnsuccessToast("Не удалось отправить заявку");
        }
      }

      return DefaultScaffold(
        title: widget.title,
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyInput(
                      fieldSubmit: getUserFetch,
                      controller: controller,
                      title: "Введите идентификатор пользователя",
                      icon: Icons.search,
                      error: "Пожалуйста заполните поле"),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
