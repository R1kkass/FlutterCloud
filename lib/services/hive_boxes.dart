import 'dart:convert';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:TalkSpace/domain/model/entities/session.dart' as session;

part 'hive_boxes.g.dart';

@HiveType(typeId: 0)
class Session extends HiveObject {
  @HiveField(0)
  String sessionId;
  @HiveField(1)
  String refreshToken;
  @HiveField(2)
  String email;
  @HiveField(3)
  String passwordHash;

  Session({
    required this.sessionId,
    required this.refreshToken,
    required this.email,
    required this.passwordHash,
  });

  session.Session get toEntity {
    return session.Session(email: email, refreshToken: refreshToken, sessionId: sessionId, passwordHash: passwordHash);
  }
}

class HiveBoxes {
  static Box<String> get chatFileUploaded {
    return Hive.box<String>("chatFileUploaded");
  }

  static Box<String> get token {
    return Hive.box<String>("token");
  }

  static Box<Map<dynamic, dynamic>> get chatsSecretKey {
    return Hive.box<Map<dynamic, dynamic>>("chatsSecretKey");
  }

  static Box<Session> get listToken {
    return Hive.box<Session>("listToken");
  }

  static Box<Map<dynamic, dynamic>> get chatPubKey {
    return Hive.box<Map<dynamic, dynamic>>("chatPubKey");
  }

  static initHiveBoxes() async {
    List<int> key = await getEncryptionKey();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SessionAdapter());
    }
    await Hive.initFlutter();
    await Hive.openBox<String>('token', encryptionCipher: HiveAesCipher(key));
    await Hive.openBox<Session>('listToken', encryptionCipher: HiveAesCipher(key));
    await Hive.openBox<Map<dynamic, dynamic>>('chatPubKey', encryptionCipher: HiveAesCipher(key));
    await Hive.openBox<Map<dynamic, dynamic>>('chatsSecretKey', encryptionCipher: HiveAesCipher(key));
    await Hive.openBox<String>('chatFileUploaded', encryptionCipher: HiveAesCipher(key));
  }

  static Future<List<int>> getEncryptionKey() async {
    const secureStorage = FlutterSecureStorage();
    var key = await secureStorage.read(key: 'hive_key');

    if (key == null) {
      final keyBytes = List<int>.generate(32, (i) => Random.secure().nextInt(256));
      key = base64UrlEncode(keyBytes);
      await secureStorage.write(key: 'hive_key', value: key);
    }

    return base64Url.decode(key);
  }
}
