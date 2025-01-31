import 'dart:math';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class DHAlgorithm {
 static Future<BigInt> generatePubKey(String p, int g, int chatId) async {
  var box = HiveBoxes.pubKey;

  BigInt key = BigInt.parse(p);

  var pp = 18;
  BigInt max = BigInt.two.pow(pp) - BigInt.one;
  BigInt min = BigInt.two.pow(pp - 1) - BigInt.one;
  Random random = Random();

  BigInt a = BigInt.from(random.nextInt((max - min + key - min).toInt()));
  await box.put(chatId.toString() + jwtDecode().email, a);

  BigInt A = BigInt.from(g);
  A = A.pow(a.toInt()) % key;

  return A;
}

static Future<BigInt> generateSecretKey(String B, String p, int chatId) async {
  var box = HiveBoxes.pubKey;
  var email = jwtDecode().email;

  int a = box.get(chatId.toString() + email)!.toInt();
  BigInt secretKey = BigInt.parse(B);
  secretKey = secretKey.pow(a) % BigInt.parse(p);

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

