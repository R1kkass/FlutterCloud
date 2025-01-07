import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/proto/files/files.pb.dart';
import 'package:TalkSpace/services/encode_file.dart';
import 'package:http/http.dart' as http;
import 'package:TalkSpace/api/my_http.dart' as my_http;
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Map<String, String> headers = {
    "Access-Token": HiveBoxes.token.get('access_token').toString()
  };
  request.headers.addAll(headers);
  request.files.add(http.MultipartFile.fromBytes(
    "file",
    body.file,
    filename: body.file_name,
  ));

  request.send().then((e) async {
    callback(e);
    var response = await FilesGrpc().findFile(FindFileRequest(
        search: "", folderId: body.folder_id, findEveryWhere: false));

    context
        .read<ContentBloc>()
        .add(ContentInit(files: response.files, folders: response.folders));
  });
}

Future<http.Response> deleteFile(int id, BuildContext context) async {
  return await my_http
      .delete(Uri.parse('$domain/file/delete/$id'), context, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}

Future<http.Response> getFile(String? id, BuildContext context) async {
  id ??= "";
  return await my_http
      .get(Uri.parse('$domain/get/open/$id'), context, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}

Future<http.Response> downloadFile(
    String? id, String fileName, BuildContext context) async {
  String path = "/storage/emulated/0/Download/$fileName";
  var key = HiveBoxes.token.get("password")!;

  var res =
      await my_http.get(Uri.parse('$domain/get/open/$id'), context, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
  EncodeFile.decryptByte(res.bodyBytes, path, key);

  return res;
}

Future getSpace(BuildContext context) async {
  return await my_http.get(Uri.parse('$domain/get/space'), context, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}

Future<http.Response> updateFile(
    String? id, String name, BuildContext context) async {
  return await my_http
      .patch(Uri.parse('$domain/file/update/$id'), context, body: {
    "name": name
  }, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}

Future<http.Response> moveFile(
    String fileId, String folderId, BuildContext context) async {
  return await my_http.patch(Uri.parse("$domain/file/move"), context, body: {
    "file_id": fileId,
    "folder_id": folderId
  }, headers: {
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
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
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
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
    "Access-Token": HiveBoxes.token.get('access_token').toString(),
  });
}
