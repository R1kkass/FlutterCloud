import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/domen.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/services/encode_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/api/my_http.dart' as my_http;

class FileParams {
  int folder_id;
  List<int> file;
  String file_name;
  FileParams(this.folder_id, this.file, this.file_name);
}

class ChangeAccessRequest {
  String folder_id;
  String file_id;
  String access_id;
  ChangeAccessRequest(
      {required this.folder_id,
      required this.file_id,
      required this.access_id});
}

Future createFile(
    FileParams body, BuildContext context, Function callback) async {
  var request = http.MultipartRequest(
    "POST",
    Uri.parse('$domain/file/create'),
  );
  request.fields['file_name'] = "body.folder_id";
  request.fields['folder_id'] = body.folder_id.toString();
  request.headers["X-CSRF-token"] = csrf;
  Map<String, String> headers = {
    "Access-Token": Hive.box('token').get('access_token').toString()
  };
  request.headers.addAll(headers);
  request.files.add(http.MultipartFile.fromBytes(
    "file",
    body.file,
    filename: body.file_name,
  ));

  request.send().then((e) {
    callback(e);
    context.read<FolderCubit>().updateDataFetch(body.folder_id, context);
  });
}

Future<http.Response> deleteFile(int id, BuildContext context) async {
  return await my_http
      .delete(Uri.parse('$domain/file/delete/$id'), context, headers: {
    "X-CSRF-token": csrf,
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

Future<http.Response> getFile(String? id, BuildContext context) async {
  id ??= "";
  return await my_http
      .get(Uri.parse('$domain/get/open/$id'), context, headers: {
    "X-CSRF-token": csrf,
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

Future<http.Response> downloadFile(
    String? id, String fileName, BuildContext context) async {
  String path = "/storage/emulated/0/Download/$fileName";
  var box = Hive.box('token');
  var key = box.get("password");

  var res =
      await my_http.get(Uri.parse('$domain/get/open/$id'), context, headers: {
    "X-CSRF-token": csrf,
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
  EncodeFile.decryptByte(res.bodyBytes, path, key);

  return res;
}

Future getSpace(BuildContext context) async {
  return await my_http.get(Uri.parse('$domain/get/space'), context, headers: {
    "X-CSRF-token": csrf,
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

Future<http.Response> updateFile(
    String? id, String name, BuildContext context) async {
  return await my_http
      .patch(Uri.parse('$domain/file/update/$id'), context, body: {
    "name": name
  }, headers: {
    "X-CSRF-token": csrf,
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

Future<http.Response> moveFile(
    String fileId, String folderId, BuildContext context) async {
  return await my_http.patch(Uri.parse("$domain/file/move"), context, body: {
    "file_id": fileId,
    "folder_id": folderId
  }, headers: {
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

Future<http.Response> changeAccessFile2(int? accessId, String? folderId,
    String? fileId, BuildContext context) async {
  return await my_http
      .patch(Uri.parse("$domain/file/changeaccess"), context, body: {
    "file_id": fileId,
    "folder_id": folderId.toString(),
    "access_id": accessId
  }, headers: {
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}

class ChangeAccessListArgs {
  final ChangeAccessRequest args;
  final BuildContext context;

  ChangeAccessListArgs({required this.args, required this.context});
}

Future<http.Response> changeAccessFile(ChangeAccessListArgs args) async {
  return await my_http
      .patch(Uri.parse("$domain/file/changeaccess"), args.context, body: {
    "file_id": args.args.file_id,
    "folder_id": args.args.folder_id,
    "access_id": args.args.access_id.toString()
  }, headers: {
    "Access-Token": Hive.box('token').get('access_token').toString(),
  });
}
