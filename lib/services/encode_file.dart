import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_2/services/encrypt_auth.dart';

class EncodeFile {
  static void encrypt(path, pathExist, key) {
    var file = File(path);
    var fileExist = File(pathExist);

    fileExist.writeAsBytesSync(crypt(true, file.readAsBytesSync(), key));
  }

  static Uint8List encrypByte(String path, String key) {
    var file = File(path);
    return crypt(true, file.readAsBytesSync(), key);
  }

  static void decrypt(path, pathExist, key) {
    var file = File(path);
    var fileExist = File(pathExist);

    fileExist.writeAsBytesSync(crypt(false, file.readAsBytesSync(), key));
  }

  static void decryptByte(Uint8List byte, String pathExist, String key) {
    try {
      var fileExist = File(pathExist);
      var countFile = 1;
      while (fileExist.existsSync()) {
        var nameFileArr = pathExist.split(".");
        if (nameFileArr.length > 1) {
          nameFileArr[nameFileArr.length - 2] =
              "${nameFileArr[nameFileArr.length - 2]} ($countFile)";
          fileExist = File(nameFileArr.join("."));
        } else {
          fileExist = File("$pathExist ($countFile)");
        }
        countFile++;
      }

      fileExist.writeAsBytesSync(crypt(false, byte, key));
    } catch (e) {
      rethrow;
    }
  }
}
