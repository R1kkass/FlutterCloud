import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

class AuthGenerateKeys {
  final BigInt a;
  final BigInt A;
  const AuthGenerateKeys({required this.a, required this.A});
}

Future<String> generateSecretKeyAuth(String B, String p, BigInt a) async {
  BigInt secretKey = BigInt.parse(B);
  secretKey = secretKey.modPow(a, BigInt.parse(p));

  List<int> bytes = utf8.encode(secretKey.toString());
  String hash = sha256.convert(bytes).toString();

  return hash;
}

Future<AuthGenerateKeys> generatePubKeyAuth(String p, int g) async {
  BigInt key = BigInt.parse(p);

  var pp = 256;
  BigInt a = generateRandomBigInt(pp);

  BigInt A = BigInt.from(g);
  A = A.modPow(a, key);

  return AuthGenerateKeys(A: A, a: a);
}

String generateIV(String cryptoText) {
  final decodedData = base64Url.decode(cryptoText);
  Uint8List ivBytes = decodedData.sublist(0, 16);
  return base64Encode(ivBytes);
}

Uint8List crypt(bool isEncrypt, Uint8List data, String secretKey) {
  var iv = generateIV(secretKey);
  final ivbytes = base64Decode(iv);
  final key = utf8.encode(secretKey);
  final aes = AESEngine();
  final params = ParametersWithIV<KeyParameter>(KeyParameter(key), ivbytes);
  final paddingParams =
      PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(
          params, null);
  final cipher = CBCBlockCipher(aes);

  final paddingCipher = PaddedBlockCipherImpl(PKCS7Padding(), cipher)
    ..init(isEncrypt, paddingParams);
  return paddingCipher.process(data);
}

Future<Uint8List> cryptFuture(
    bool isEncrypt, Uint8List data, String secretKey) async {
  var iv = generateIV(secretKey);
  final ivbytes = base64Decode(iv);
  final key = utf8.encode(secretKey);
  final aes = AESEngine();
  final params = ParametersWithIV<KeyParameter>(KeyParameter(key), ivbytes);
  final paddingParams =
      PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(
          params, null);
  final cipher = CBCBlockCipher(aes);

  final paddingCipher = PaddedBlockCipherImpl(PKCS7Padding(), cipher)
    ..init(isEncrypt, paddingParams);
  return paddingCipher.process(data);
}

String encrypt(String data, String secretKey) {
  final plaintext = utf8.encode(data);
  var ciphertext = crypt(true, plaintext, secretKey);
  return base64Encode(ciphertext);
}

String decrypt(String data, String secretKey) {
  final ciphertext = base64Decode(data);
  final decrypted = crypt(false, ciphertext, secretKey);
  return utf8.decode(decrypted);
}

BigInt generateRandomBigInt(int bitLength) {
  final random = Random.secure(); // Use Random.secure() for cryptographic purposes
  BigInt result = BigInt.zero;
  int remainingBits = bitLength;

  while (remainingBits > 0) {
    // Generate an int (up to 32 bits on most platforms)
    int nextBits = remainingBits >= 32 ? 32 : remainingBits;
    int mask = (1 << nextBits) - 1;
    int randomPart = random.nextInt(1 << nextBits); // nextInt takes exclusive max value

    // Combine the random part into the result
    result = (result << nextBits) | BigInt.from(randomPart);
    remainingBits -= nextBits;
  }

  return result;
}
