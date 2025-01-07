import 'dart:convert';

import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/api/file_api.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/proto/users/users.pb.dart';
import 'package:http/http.dart' as http;
import 'package:TalkSpace/api/my_http.dart' as my_http;

class FolderParams {
  String? name_folder;
  dynamic folder_id;
  FolderParams(this.name_folder, this.folder_id);
}

class FolderParamsPatch {
  String? name_folder;
  FolderParamsPatch(this.name_folder);
}

Future<http.Response> createFolder(
    FolderParams body, BuildContext context) async {
  Map<String, String> editedBody = {
    "name_folder": body.name_folder.toString(),
  };
  if (body.folder_id != null) {
    editedBody["folder_id"] = body.folder_id.toString();
  }
  return await my_http.post(Uri.parse('$domain/folder/create'), context,
      body: editedBody,
      headers: {
        "Access-Token": HiveBoxes.token.get('access_token') ?? "",
      });
}

Future<GetData> getFolder(id, GetData state, BuildContext context) async {
  if (id == 0) id = "";
  var response = await my_http
      .get(Uri.parse('$domain/get/${id ?? ""}'), context, headers: {
    "Access-Token": HiveBoxes.token.get('access_token') ?? "",
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

  return GetData(
      folders: folders,
      files: files,
      uploadFile: state.uploadFile,
      downloadFile: state.downloadFile,
      status_code: response.statusCode);
}

Future<http.Response> deleteFolder(int id, BuildContext context) async {
  return await my_http
      .delete(Uri.parse('$domain/folder/delete/$id'), context, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}

Future<http.Response> updateFolder(
    String? id, String body, BuildContext context) async {
  return await my_http
      .patch(Uri.parse('$domain/folder/update/$id'), context, body: {
    "name": body
  }, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}

Future<http.Response> moveFolder(
    String folderId, String folderToId, BuildContext context) async {
  return await my_http.patch(Uri.parse("$domain/folder/move"), context, body: {
    "folder_to_id": folderToId,
    "folder_id": folderId
  }, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}

Future<http.Response> changeAccessFolder(ChangeAccessListArgs data) async {
  var args = data.args;
  return await my_http
      .patch(Uri.parse("$domain/folder/changeaccess"), data.context, body: {
    "folder_id": args.folder_id,
    "access_id": args.access_id.toString()
  }, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}
