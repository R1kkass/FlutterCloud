import 'dart:convert';

import 'package:TalkSpace/gen/dart/auth/auth.pb.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:TalkSpace/grpc/keys_grpc.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:crypto/crypto.dart';

class SubmitMail {
  final _authGrpc = AuthGrpc();
  final _keysGrpc = KeysGrpc();

  Future<String> submit(String email, String password, String key, String secretKey) async {
    key = encrypt(key, secretKey);

    var submitResponse = await _authGrpc.submitEmail(SubmitEmailRequest(
        email: email, password: password, key: key));
    var accessToken = decrypt(submitResponse.accessToken, secretKey);
    var refreshToken = decrypt(submitResponse.refreshToken, secretKey);
    var sessionId = decrypt(submitResponse.sessionId, secretKey);

    await HiveBoxes.token.put('access_token', accessToken);
    await HiveBoxes.listToken.put(email, Session(sessionId: sessionId, refreshToken: refreshToken));

    List<int> bytes = utf8.encode(password);
    String hash = sha256.convert(bytes).toString();
    await HiveBoxes.token.put('password', hash.substring(0, 32));

    await _keysGrpc.getKeys();

    return accessToken;
  }
}

