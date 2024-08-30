import 'dart:math';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:hive/hive.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

bool conditions(int p, int g) {
  if (p % 8 == 7 && g == 2) {
    return true;
  }
  if (p % 3 == 2 && g == 3) {
    return true;
  }
  if (g == 4) {
    return true;
  }
  if ((p % 5 == 1 || p % 5 == 4) && g == 5) {
    return true;
  }
  if ((p % 24 == 19 || p % 24 == 23) && g == 6) {
    return true;
  }
  if ((p % 7 == 3 || p % 7 == 5 || p % 7 == 6) && g == 7) {
    return true;
  }

  return false;
}

Future<BigInt> generatePubKey(String p, int g, int chatId) async {
  var box = await Hive.openBox('pubkey');

  BigInt key = BigInt.parse(p);

  var pp = 10;
  BigInt max = BigInt.two.pow(pp) - BigInt.one;
  BigInt min = BigInt.two.pow(pp - 1) - BigInt.one;
  Random random = Random();

  BigInt a = BigInt.from(random.nextInt((max - min + key - min).toInt()));
  box.put(chatId.toString() + jwtDecode().email, a);

  BigInt A = BigInt.from(g);
  A = A.pow(a.toInt()) % key;

  return A;
}

bool natural(int n) {
  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

Future<BigInt> generateSecretKey(String B, String p, int chatId) async {
  var box = await Hive.openBox('pubkey');

  int a = box.get(chatId.toString() + jwtDecode().email).toInt();
  BigInt secretKey = BigInt.parse(B);
  secretKey = secretKey.pow(a) % BigInt.parse(p);

  box = await Hive.openBox('secretkey');
  List<int> bytes = utf8.encode(secretKey.toString());
  String hash = sha256.convert(bytes).toString();

  box.put(chatId.toString() + jwtDecode().email, secretKey);

  return secretKey;
}
