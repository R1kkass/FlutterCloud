import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';

class ChatSecretKeysLocalDataSource {
  final _chatsSecretKey = HiveBoxes.chatsSecretKey;

  addSecretKey(int chatId, String secretKey) async {
    var email = jwtDecode().email;
    var userSecretKeys = _chatsSecretKey.get(email)!;

    if (userSecretKeys[chatId.toString()] == null) {
      userSecretKeys[chatId.toString()] = secretKey;
    }

    await _chatsSecretKey.put(email, userSecretKeys);
  }

  String? getSecretKey(int chatId) {
    var email = jwtDecode().email;
    var userSecretKeys = _chatsSecretKey.get(email)!;

    return userSecretKeys[chatId.toString()];
  }

  Map<dynamic, dynamic>? getSecretKeys() {
    var email = jwtDecode().email;
    return _chatsSecretKey.get(email);
  }

  addSecretKeys(Map<String, String> chatKeys) async {
    var email = jwtDecode().email;

    var password = HiveBoxes.token.get("password")!;
    Map<dynamic, dynamic> userKeys = getSecretKeys() ?? {};
    for (var item in chatKeys.keys) {
      userKeys[item] = decrypt(chatKeys[item]!, password);
    }
    await _chatsSecretKey.put(email, userKeys);
  }
}
