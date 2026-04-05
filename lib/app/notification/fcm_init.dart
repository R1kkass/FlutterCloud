import 'package:TalkSpace/app/notification/fcm_notification_service.dart';
import 'package:TalkSpace/app/notification/type_notification_enum.dart';
import 'package:TalkSpace/firebase_options.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FcmInit {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final _notificationService = FcmNotificationService();
  late AndroidNotificationChannel androidChannel;
  bool isFlutterLocalNotificationsInitialized = false;

  @pragma('vm:entry-point')
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await HiveBoxes.initHiveBoxes();

    await setupFlutterNotifications();
    showFlutterNotification(message);
  }

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    final data = message.data;
    final NotificationDTO notify;
    switch (data["type"]) {
      case TypeNotificationEnum.newMessage:
        notify = _notificationService.newMessage(message);
      case TypeNotificationEnum.createChat:
        notify = _notificationService.createChat(message);
      default:
        return;
    }

    _flutterLocalNotificationsPlugin.show(
      data.hashCode,
      notify.title,
      notify.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidChannel.id,
          androidChannel.name,
          channelDescription: androidChannel.description,
          icon: 'launch_background',
        ),
      ),
    );
  }
}

