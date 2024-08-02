import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/services/file_size.dart';

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
      child: ListView(
        children: [
          TextButton(
              onPressed: () {},
              child: Column(children: [
                const Icon(Icons.cloud_outlined),
                SliderTheme(
                  child: Slider(
                    value: space.toDouble(),
                    onChanged: (e) {},
                    min: 0,
                    max: 536870912 * 2,
                    inactiveColor: Colors.deepOrange.shade100,
                  ),
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.transparent,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
                ),
                Text(text),
              ])),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SEARCH_USERS);
              },
              child: const Text("Поиск пользователей"))
        ],
      ),
    );
  }
}
