import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/pages/files_users.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:grpc/grpc.dart';

class UsersList extends StatefulWidget {
  final List<Users> users;
  const UsersList({super.key, required this.users});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    List users = widget.users;
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
              onPressed: () {
                // Navigator.pushNamed(context, AppRouter.FILES_USERS,
                //     arguments: ArgsFilesUsers(user: users[index]));
              },
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
                        Navigator.pop(context);
                        try {
                          await ChatGrpc()
                              .createChat(CreateRequestChat(otherId: otherId));
                          showToast(context, "Запрос отправлен");
                        } on GrpcError catch (e) {
                          showToast(context, e.message as String);
                        } catch (e) {
                          showToast(context, "Запрос не отправлен");
                        }
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
}
