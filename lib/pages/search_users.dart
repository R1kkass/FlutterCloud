import 'package:flutter/material.dart';
import 'package:TalkSpace/components/default_scaffold.dart';
import 'package:TalkSpace/shared/my_input.dart';
import 'package:TalkSpace/components/users_list.dart';
import 'package:TalkSpace/grpc/user_grpc.dart';
import 'package:TalkSpace/proto/users/users.pb.dart';

class SearchUsers extends StatefulWidget {
  final String title;

  const SearchUsers({super.key, required this.title});

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  List<Users> users = [];
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  getUserFetch(text) async {
    var response = await UserGrpc().getUsers(GetUsersRequest(userName: text));
    users = response.data;
    setState(() {});
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
                    fieldSubmit: (e) {
                      getUserFetch(e);
                    },
                    controller: controller,
                    title: "Поиск по E-mail или имени",
                    icon: Icons.search,
                    error: "Пожалуйста заполните поле"),
              ],
            ),
          ),
          Expanded(
            child: UsersList(
              users: users,
            ),
          ),
        ],
      ),
    );
  }
}
