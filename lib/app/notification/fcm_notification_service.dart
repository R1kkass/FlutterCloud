import 'package:TalkSpace/services/encrypt_message.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmNotificationService {
  NotificationDTO newMessage(RemoteMessage message) {
     Map<String, dynamic> data = message.data;

    var notify = remoteMessageDataToDataNotification(data);

    var secretKey = HiveBoxes.chatsSecretKey.get(jwtDecode().email)?[notify.customProperties] ?? "";
    var body = EncryptMessage().decrypt(notify.body, secretKey);

    return NotificationDTO(body: body, title: notify.title);
  }

  NotificationDTO createChat(RemoteMessage message) {
    var title = "Запрос на новый чат";
    var body = "Пользователь TODO отправил Вам заявку на создание чата";

    return NotificationDTO(body: body, title: title);
  }

  DataNotification remoteMessageDataToDataNotification(Map<String, dynamic> data) {
    return DataNotification(
      body: data["body"],
      title: data["title"],
      customProperties: data["custom_properties"],
    );
  }
}

class DataNotification {
  final String title;
  final String body;
  final String customProperties;

  DataNotification({
    required this.body,
    required this.title,
    required this.customProperties,
  });
}

class NotificationDTO {
  final String title;
  final String body;

  NotificationDTO({
    required this.body,
    required this.title,
  });
}
