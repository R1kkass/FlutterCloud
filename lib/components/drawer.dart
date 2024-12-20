import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/services/file_size.dart';
import 'package:flutter_application_2/services/token_clear.dart';

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
              text = "Занято: ${fileSize(space)} из 1 Гб";
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
            Divider(
              color: Colors.deepOrange.shade100,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRouter.CHANGE_ACCOUNT, (r) => false);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.swap_horiz),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Сменить пользователя",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRouter.AUTH, (r) => false);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.redo),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Войти в другой аккаунт",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRouter.DOWNLOAD, (r) => false);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.download_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Загрузки",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
            const Spacer(),
            TextButton(
                onPressed: () {
                  tokenClear(context);
                  Navigator.pushNamed(context, AppRouter.AUTH);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
