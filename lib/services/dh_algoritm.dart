import 'package:TalkSpace/services/index.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class DHAlgorithm {
  static Future<Map<String, BigInt>> generatePubKey(String p, String g) async {
    BigInt key = BigInt.parse(p);

    BigInt a = generateRandomBigInt(256);

    BigInt A = BigInt.parse(g);
    A = A.modPow(a, key);

    return {
      "A": A,
      "a": a
    };
  }

  static Future<String> generateSecretKey(BigInt alicePrivateKey, String bobPublicKey, String p) async {
    var bobPublicKeyBigInt = BigInt.parse(bobPublicKey);

    var secretKey = bobPublicKeyBigInt.modPow(alicePrivateKey, BigInt.parse(p));

    List<int> bytes = utf8.encode(secretKey.toString());
    String hash = sha256.convert(bytes).toString();

    return hash;
  }

}

