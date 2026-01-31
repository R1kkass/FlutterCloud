import 'package:firebase_messaging/firebase_messaging.dart';

class FcmInit {
  static init() async {
    final notificationSettings = await FirebaseMessaging.instance.requestPermission(provisional: true);

    // For apple platforms, make sure the APNS token is available before making any FCM plugin API calls
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      // APNS token is available, make FCM plugin API requests...
    }
  }
}