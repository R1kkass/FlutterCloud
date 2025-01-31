import 'package:flutter/material.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:TalkSpace/grpc/chat_grpc.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:TalkSpace/proto/users/users.pb.dart';

class UsersList extends StatefulWidget {
  final List<Users> users;
  const UsersList({super.key, required this.users});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    var users = widget.users;
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Material(
            elevation: 5.0,
            child: TextButton(
              style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  overlayColor: WidgetStateProperty.all(Colors.black12),
                  textStyle: WidgetStateProperty.all(
                      const TextStyle(color: Colors.black)),
                  shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ))),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        users[index].name,
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        users[index].email,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          showModalUser(users[index].id);
                        },
                        child: const Icon(Icons.more_vert, size: 20)),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          );
        });
  }

  void showModalUser(int otherId) {
    showModalBottomSheet<void>(
        context: context,
        builder: (_) {
          return SizedBox(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () async {
                        await _create(otherId);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.add_comment_outlined, size: 30),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Запросить разрешение на сообщение",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }

  Future _create(int otherId) async {
    try {
      await _createChat(otherId);
    } catch (e) {
      showUnsuccessToast("Запрос не отправлен");
    }
  }

  Future _createChat(int otherId) async {
    Navigator.pop(context);
    await ChatGrpc().createChat(CreateRequestChat(otherId: otherId));
    showSuccessToast("Запрос отправлен");
  }
}
