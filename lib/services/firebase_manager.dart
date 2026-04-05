import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseManager {
  Future<String?> get notificationToken async {
    String? token = await FirebaseMessaging.instance.getToken();

    return token;
  }
}