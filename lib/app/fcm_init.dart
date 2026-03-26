import 'dart:ui';

import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FcmInit {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final data = message.data;

      final title = data['title'] ?? "";
      final body = data['body'] ?? "";
      final chatId = data['chat_id'] ?? "";

      var secretKey = HiveBoxes.chatsSecretKey.get(jwtDecode().email)?[chatId] ?? "";
      final modifiedTitle = decrypt(title, secretKey);
      final modifiedBody = decrypt(body, secretKey);

      showCustomNotification(modifiedTitle, modifiedBody, data);
    });
  }

  Future<void> showCustomNotification(
      String title,
      String body,
      Map<String, dynamic> data,
      ) async {
    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'custom_channel_id',
      'Канал уведомлений',
      channelDescription: 'Описание канала',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: const RawResourceAndroidNotificationSound('notification_sound'),
      enableVibration: true,
      // vibrationPattern: Int64List.fromList(const [0, 500, 200, 500]),
      color: const Color(0xFF2196F3),
      icon: '@mipmap/ic_launcher',
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'notification_sound.wav',
      badgeNumber: 1,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecond,
      title,
      body,
      notificationDetails,
      payload: data['click_action'],
    );
  }

}