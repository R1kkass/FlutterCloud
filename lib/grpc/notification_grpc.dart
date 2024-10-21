import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/notification/notification.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class NotificationGrpc {
  final _stub = NotificationGreeterClient(channel);
  CallOptions get _options {
    return CallOptions(metadata: {
      "authorization": "Bearer ${
        Hive.box("token").get("access_token")}",
    });
  }

  ResponseStream<NotificationMessage> getNotification() {
    return _stub.getNotification(Empty(), options: _options);
  }
}
