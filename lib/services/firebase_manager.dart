import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseManager {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      provisional: true,
    );

    String? apnsToken = await _firebaseMessaging.getAPNSToken();
    if (apnsToken != null) {}
  }

  Future<String?> get notificationToken async {
    String? token = await FirebaseMessaging.instance.getToken();

    return token;
  }
}