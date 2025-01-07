import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/proto/notification/notification.pbgrpc.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:grpc/grpc.dart';

class NotificationGrpc {
  final _stub = NotificationGreeterClient(channel);
  CallOptions get _options {
    return CallOptions(metadata: {
      "authorization": "Bearer ${HiveBoxes.token.get("access_token")}",
    });
  }

  ResponseStream<NotificationMessage> getNotification() {
    return _stub.getNotification(Empty(), options: _options);
  }
}
