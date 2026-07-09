import 'package:TalkSpace/services/index.dart';

class ChatPublicKeysLocalDataSource {
  final _chatPubKey = HiveBoxes.chatPubKey;

  addPublicKey(int chatId, BigInt pubKey) async {
    var email = jwtDecode().email;
    var userSecretKeys = _chatPubKey.get(email) ?? {};

    if (userSecretKeys[chatId.toString()] == null) {
      userSecretKeys[chatId.toString()] = pubKey;
    }

    await _chatPubKey.put(email, userSecretKeys);
  }

  BigInt? getPubKey(int chatId) {
    var email = jwtDecode().email;
    var userSecretKeys = _chatPubKey.get(email);

    return userSecretKeys?[chatId.toString()];
  }

  Map<dynamic, dynamic>? getPubKeys() {
    var email = jwtDecode().email;
    return _chatPubKey.get(email);
  }
}
