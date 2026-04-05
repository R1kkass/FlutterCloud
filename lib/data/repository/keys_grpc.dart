import 'dart:convert';
import 'package:TalkSpace/data/repository/base_grpc.dart';

import 'package:TalkSpace/gen/dart/keys/keys.pbgrpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';

class KeysGrpc extends BaseGrpc {
  late final _stub = KeysGreeterClient(channel, interceptors: [AuthInterceptor()]);

  Future<KeysUploadResponse> uploadFile(KeysUploadRequest request) {
    return retry(() => _stub.uploadKeys(request));
  }

  Future<String> get downloadKeys async {
    var list = await retry(() => _stub.downloadKeys(Empty()).toList());
    List<int> listChunk = [];
    for (var item in list) {
      listChunk = [...listChunk, ...item.chunk];
    }
    return utf8.decode(listChunk);
  }

  getKeys() async {
    var email = jwtDecode().email;

    var secretBox = HiveBoxes.chatsSecretKey;
    var password = HiveBoxes.token.get("password")!;
    var chatKeys = await downloadKeys;
    chatKeys = chatKeys != "" ? chatKeys : "{}";
    Map<String, dynamic> data = jsonDecode(chatKeys);
    Map<dynamic, dynamic> userKeys = secretBox.get(email) ?? {};
    for (var item in data.keys) {
      var decryptKey = decrypt(data[item]!, password);
      userKeys[item] = decryptKey;
    }
    await secretBox.put(email, userKeys);
  }

  uploadNewKeys() async {
    var email = jwtDecode().email;
    final secretBox = HiveBoxes.chatsSecretKey;
    var keys = secretBox.get(email)?.keys.toList() ?? [];
    var values = secretBox.get(email);
    var resultObj = {};

    var pass = HiveBoxes.token.get("password")!;

    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      resultObj[key] = encrypt(values![key]!, pass);
    }
    List<int> json = utf8.encode(jsonEncode(resultObj).toString());
    await retry(() => uploadFile(KeysUploadRequest(chunk: json)));
  }
}
