import 'dart:convert';
import 'package:TalkSpace/main.dart';

import 'package:TalkSpace/proto/keys/keys.pbgrpc.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:grpc/grpc.dart';

class KeysGrpc {
  final _stub = KeysGreeterClient(channel);
  final secretBox = HiveBoxes.chatsSecretKey;

  CallOptions get _options {
    return CallOptions(metadata: {
      "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
    });
  }

  Future<KeysUploadResponse> uploadFile(KeysUploadRequest request) {
    return _stub.uploadKeys(request, options: _options);
  }

  Future<String> get downloadKeys async {
    var list = await _stub.downloadKeys(Empty(), options: _options).toList();
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
    var chatKeys = await KeysGrpc().downloadKeys;
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
    var keys = secretBox.get(email)?.keys.toList() ?? [];
    var values = secretBox.get(email);
    var resultObj = {};

    var pass = HiveBoxes.token.get("password")!;

    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      resultObj[key] = encrypt(values![key]!, pass);
    }
    List<int> json = utf8.encode(jsonEncode(resultObj).toString());
    await KeysGrpc().uploadFile(KeysUploadRequest(chunk: json));
  }
}
