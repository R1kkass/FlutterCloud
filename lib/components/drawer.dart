import 'package:TalkSpace/features/file/get_space.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
 
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GetSpace(),
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
                  AuthGrpc().tokenClear();
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
