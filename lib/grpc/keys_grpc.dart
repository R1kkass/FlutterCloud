import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_application_2/main.dart';

import 'package:flutter_application_2/proto/keys/keys.pbgrpc.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class KeysGrpc {
  final _stub = KeysGreeterClient(channel);
  CallOptions get _options {
    return CallOptions(metadata: {
      "authorization": "Bearer ${Hive.box('token').get('access_token')}",
    });
  }

  Future<KeysUploadResponse> uploadFile(KeysUploadRequest request) {
    return _stub.uploadKeys(request, options: _options);
  }

  Future<String> get downloadKeys async {
    var password = Hive.box('token').get("password");
    var list = await _stub.downloadKeys(Empty(), options: _options).toList();
    List<int> listChunk = [];
    for (var item in list) {
      listChunk = [...listChunk, ...item.chunk];
    }
    return  utf8.decode(crypt(false, Uint8List.fromList(listChunk), password));
  }
}
