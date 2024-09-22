import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_2/services/encrypt_auth.dart';

class EncodeFile {
  //instead of plain text convert key,iv to base64 and use .fromBase64 for better security

  static void encrypt(path, pathExist, key) {
    var file = File(path);
    var fileExist = File(pathExist);

    fileExist.writeAsBytesSync(crypt(true, file.readAsBytesSync(), key));
  }

  static void decrypt(path, pathExist, key) {
    var file = File(path);
    var fileExist = File(pathExist);

    fileExist.writeAsBytesSync(crypt(false, file.readAsBytesSync(), key));
  }

    static void decryptByte(Uint8List byte, String pathExist, String  key) {
    var fileExist = File(pathExist);

    fileExist.writeAsBytesSync(crypt(false, byte, key));
  }
}

void main() async {
  // List<int> bytes = utf8.encode("12345678".toString());
  String hash = "d49fde18aef6433d6bcade6f615ea300";
  // EncodeFile.encrypt("some.text", "dec_some.text", hash);
  EncodeFile.decrypt("some.jpg", "dd_some.jpg", hash);
}
