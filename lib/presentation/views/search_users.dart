import 'package:TalkSpace/data/repository/chat_grpc.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/components/default_scaffold.dart';
import 'package:TalkSpace/shared/my_input.dart';
import 'package:TalkSpace/gen/dart/user/user.pb.dart';

class SearchUsers extends StatefulWidget {
  final String title;

  const SearchUsers({super.key, required this.title});

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  List<User> users = [];
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _getUserFetch(text) async {
    await ChatGrpc().createChat(CreateRequestChat(companionUuid: text));
    setState(() {});
  }

  getUserFetch(text) async {
    try {
      await _getUserFetch(text);
    } catch (e) {
      showUnsuccessToast("Не удалось отправить зайявку");
    }
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
