import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:flutter_application_2/services/file_size.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int space = 0;
  String text = "Загрузка...";

  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    getSpace(context).then((e) {
      e.statusCode == 200
          ? setState(() {
              space = json.decode(e.body)["space"];
              text = "Занято ${fileSize(space)} из 1 Гб";
            })
          : setState(() {
              text = "Ошибка";
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
                onPressed: () {},
                child: Column(children: [
                  const Icon(Icons.cloud_outlined),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.transparent,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0)),
                    child: Slider(
                      value: space.toDouble(),
                      onChanged: (e) {},
                      min: 0,
                      max: 536870912 * 2,
                      inactiveColor: Colors.deepOrange.shade100,
                    ),
                  ),
                  Text(text),
                ])),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, SEARCH_USERS, (r) => false);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Поиск пользователей",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, CHAT_LIST, (r) => false);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Чаты",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
            const Spacer(),
            TextButton(
                onPressed: () {
                  var box = Hive.box("token");
                  box.delete("access_token");
                  context.read<TokenCubit>().updateToken("");
                  Navigator.pushNamed(context, AUTH);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.exit_to_app_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Выход",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
