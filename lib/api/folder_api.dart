import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/features/folder/folder.dart';
import 'package:flutter_application_2/consts/domen.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/api/my_http.dart' as my_http;

class FolderParams {
  String? name_folder;
  dynamic folder_id;
  FolderParams(this.name_folder, this.folder_id);
}

class FolderParamsPatch {
  String? name_folder;
  FolderParamsPatch(this.name_folder);
}

class GetData {
  GeneralFields? body;
  int status_code;

  GetData(this.body, this.status_code);
}

Future<http.Response> createFolder(
    FolderParams body, BuildContext context) async {
  var editedBody = {
    "name_folder": body.name_folder,
  };
  if (body.folder_id != null) {
    editedBody["folder_id"] = body.folder_id;
  }
  return await my_http.post(Uri.parse('$domain/folder/create'), context,
      body: editedBody,
      headers: {
        "X-CSRF-token": csrf,
        "Access-Token": Hive.box('token').get('access_token'),
      });
}

Future<GetData> getFolder(id, BuildContext context) async {
  if (id == 0) id = "";
  var response = await my_http
      .get(Uri.parse('$domain/get/${id ?? ""}'), context, headers: {
    "X-CSRF-token": csrf,
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
  List<Folder?> folders = [];
  List<File?> files = [];

  List<dynamic> data = json.decode(response.body)["folders"];

  for (var i = 0; i < data.length; i++) {
    folders.add(Folder.fromJsonCustom(data[i]));
  }

  data = json.decode(response.body)["files"];
  for (var i = 0; i < data.length; i++) {
    files.add(File.fromJsonCustom(data[i]));
  }

  return GetData(GeneralFields(folders, files), response.statusCode);
}

Future<http.Response> deleteFolder(int id, BuildContext context) async {
  return await my_http
      .delete(Uri.parse('$domain/folder/delete/$id'), context, headers: {
    "X-CSRF-token": csrf,
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

Future<http.Response> updateFolder(
    String? id, String body, BuildContext context) async {
  return await my_http
      .patch(Uri.parse('$domain/folder/update/$id'), context, body: {
    "name": body
  }, headers: {
    "X-CSRF-token": csrf,
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

Future<http.Response> moveFolder(
    String folderId, String folderToId, BuildContext context) async {
  return await my_http.patch(Uri.parse("$domain/folder/move"), context, body: {
    "folder_to_id": folderToId,
    "folder_id": folderId
  }, headers: {
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

Future<http.Response> changeAccessFolder(ChangeAccessListArgs data) async {
  var args = data.args;
  return await my_http
      .patch(Uri.parse("$domain/folder/changeaccess"), data.context, body: {
    "folder_id": args.folder_id,
    "access_id": args.access_id.toString()
  }, headers: {
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}
