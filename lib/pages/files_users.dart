import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/grpc/user_grpc.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:flutter_application_2/proto/users/users.pbgrpc.dart';
import 'package:flutter_application_2/components/file.dart';
import 'package:flutter_application_2/components/folder.dart';

class ArgsFilesUsers {
  final Users user;

  const ArgsFilesUsers({required this.user});
}

class FilesUsers extends StatefulWidget {
  final String title;
  final ArgsFilesUsers args;

  const FilesUsers({super.key, required this.title, required this.args});

  @override
  State<FilesUsers> createState() => _FilesUsersState();
}

class _FilesUsersState extends State<FilesUsers> {
  GetContentUserResponse files = GetContentUserResponse();

  void intitState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    files =
        await getContentUsers(GetContentUserRequest(id: widget.args.user.id));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        title: "${widget.title} ${widget.args.user.name}",
        body: Container(
          child: FileComponent(file: files.data.files[0]),
        ));
  }
}
