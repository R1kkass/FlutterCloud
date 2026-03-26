import 'dart:math';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class DHAlgorithm {
 static Future<BigInt> generatePubKey(String p, int g, int chatId) async {
  var box = HiveBoxes.pubKey;

  BigInt key = BigInt.parse(p);

  var pp = 256;
  BigInt a = generateRandomBigInt(pp);
  await box.put(chatId.toString() + jwtDecode().email, a);

  BigInt A = BigInt.from(g);
  A = A.modPow(a, key);

  return A;
}

static Future<BigInt> generateSecretKey(String B, String p, int chatId) async {
  var box = HiveBoxes.pubKey;
  var email = jwtDecode().email;

  BigInt a = BigInt.parse(box.get(chatId.toString() + email).toString());
  BigInt secretKey = BigInt.parse(B);
  secretKey = secretKey.modPow(a, secretKey);

  List<int> bytes = utf8.encode(secretKey.toString());
  String hash = sha256.convert(bytes).toString();

  var userSecretKeys = HiveBoxes.chatsSecretKey.get(email)!;

  if (userSecretKeys[chatId.toString()] == null) {
    userSecretKeys[chatId.toString()] = hash;
  }

  await HiveBoxes.chatsSecretKey.put(email, userSecretKeys);

  return secretKey;
}

}

