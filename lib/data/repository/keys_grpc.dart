import 'dart:convert';
import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/data/sources/local/chat_secret_keys_local_data_source.dart';
import 'package:TalkSpace/domain/repository/keys_repository.dart';
import 'package:TalkSpace/gen/dart/keys/keys.pbgrpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/services/index.dart';

class KeysGrpc extends BaseGrpc implements KeysRepository {
  late final _stub = KeysGreeterClient(channel, interceptors: [AuthInterceptor()]);
  ChatSecretKeysLocalDataSource chatSecretKeysLocalDataSource;

  KeysGrpc({
    required this.chatSecretKeysLocalDataSource
  });

  Future<KeysUploadResponse> _uploadFile(KeysUploadRequest request) {
    return retry(() => _stub.uploadKeys(request));
  }

  @override
  Future<String> get downloadKeys async {
    var list = await retry(() => _stub.downloadKeys(Empty()).toList());
    List<int> listChunk = [];
    for (var item in list) {
      listChunk = [...listChunk, ...item.chunk];
    }
    return utf8.decode(listChunk);
  }

  @override
  Future<Map<String, String>> getKeys() async {
    var chatKeys = await downloadKeys;
    chatKeys = chatKeys != "" ? chatKeys : "{}";
    Map<String, String> data = Map<String, String>.from(jsonDecode(chatKeys));

    await chatSecretKeysLocalDataSource.addSecretKeys(data);

    return data;
  }

  @override
  Future<String> uploadNewKeys() async {
    var secretKeys = chatSecretKeysLocalDataSource.getSecretKeys();
    var keys = secretKeys?.keys.toList() ?? [];
    var values = secretKeys;
    var resultObj = {};

    var pass = HiveBoxes.token.get("password")!;

    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      resultObj[key] = encrypt(values![key]!, pass);
    }
    List<int> json = utf8.encode(jsonEncode(resultObj).toString());
    return (await retry(() => _uploadFile(KeysUploadRequest(chunk: json)))).message;
  }
}
