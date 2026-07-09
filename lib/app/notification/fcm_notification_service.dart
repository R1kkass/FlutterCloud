import 'package:TalkSpace/services/index.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmNotificationService {
  NotificationDTO newMessage(RemoteMessage message) {
    Map<String, dynamic> data = message.data;
    var secretKey = HiveBoxes.chatsSecretKey.get(jwtDecode().email)?[data["custom_properties"]] ?? "";
    data['body'] = EncryptMessage().decrypt(data['body'], secretKey);
    var notify = _remoteMessageDataToDataNotification(data);
    return NotificationDTO(body: notify.body, title: notify.title);
  }

  NotificationDTO createChat(RemoteMessage message) {
    var title = "Запрос на новый чат";
    var body = "Пользователь TODO отправил Вам заявку на создание чата";

    return NotificationDTO(body: body, title: title);
  }

  DataNotification _remoteMessageDataToDataNotification(Map<String, dynamic> data) {
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
