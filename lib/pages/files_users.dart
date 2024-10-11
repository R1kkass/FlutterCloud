import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/grpc/user_grpc.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:flutter_application_2/proto/users/users.pbgrpc.dart';
import 'package:flutter_application_2/features/file/file.dart';
import 'package:flutter_application_2/features/folder/folder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  GetContentUserResponse contents = GetContentUserResponse();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    contents = await UserGrpc()
        .getContentUsers(GetContentUserRequest(id: widget.args.user.id));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var files = contents.data.files;
    var folders = contents.data.folder;
    var filesRequestAccess = contents.data.fileRequestAccess;
    var foldersRequestAccess = contents.data.folderRequestAccess;

    return BlocBuilder<FolderCubit, GetData>(builder: (context, state) {
      return DefaultScaffold(
          title: "${widget.title} ${widget.args.user.name}",
          body: ListView(
            children: [
              ...paintContent(
                  files, (file) => FileComponent(file: file as FileFind)),
              ...paintContent(folders,
                  (folder) => FolderComponent(folder: folder as FolderFind)),
              ...paintContent(filesRequestAccess,
                  (file) => FileComponent(file: file as FileFind)),
              ...paintContent(foldersRequestAccess,
                  (folder) => FolderComponent(folder: folder as FolderFind)),
            ],
          ));
    });
  }
}

List<dynamic> paintContent(
    List<dynamic> contents, Widget Function(dynamic arguments) widget) {
  List<dynamic> childrens = [];
  for (var content in contents) {
    childrens.add(widget(content));
  }

  return childrens;
}
