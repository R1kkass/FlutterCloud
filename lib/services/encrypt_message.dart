import 'dart:convert';

import 'package:encrypt/encrypt.dart';

Encrypted encrypt(String text, String hash) {
  final key = Key.fromUtf8(hash);

  final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
  final fernet = Fernet(b64key);
  final encrypter = Encrypter(fernet);

  final encrypted = encrypter.encrypt(text);
  return encrypted;
}

String decrypt(String hashText, String hash) {
  try {
    final key = Key.fromUtf8(hash);

    final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));

    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    final decrypted = encrypter.decrypt64(hashText);

    return decrypted;
  } catch (e) {
    return "Ошибка: Невозможно прочесть сообщение";
  }
}
