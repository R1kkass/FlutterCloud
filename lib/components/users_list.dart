import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/pages/files_users.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';

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
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, FILES_USERS,
                    arguments: ArgsFilesUsers(user: users[index]));
              },
            ),
          );
        });
  }
}
