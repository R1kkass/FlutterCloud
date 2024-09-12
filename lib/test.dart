import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

void main() {
 DateTime dateTime = DateTime.now();
 print(dateTime.timeZoneName);
 print(dateTime.timeZoneOffset);
}
