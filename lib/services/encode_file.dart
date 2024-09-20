import 'dart:convert';
import 'dart:io';


import 'package:crypto/crypto.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';

class EncodeFile {
  //instead of plain text convert key,iv to base64 and use .fromBase64 for better security

  static void encrypt(path, path_exist, key) {
    var file = File(path);
    var file_exist = File(path_exist);

    file_exist.writeAsBytesSync(crypt(true, file.readAsBytesSync(), key));

  }

  static  void decrypt(path, path_exist, key) {
    var file = File(path);
    var file_exist = File(path_exist);

    file_exist.writeAsBytesSync(crypt(false, file.readAsBytesSync(), key));
  }
}

void main() async{
  List<int> bytes = utf8.encode("123".toString());
  String hash = sha256.convert(bytes).toString().substring(0,32);
  EncodeFile.encrypt("some.text", "dec_some.text", hash);
  EncodeFile.decrypt("dec_some.text", "dd_some.text", hash);
}