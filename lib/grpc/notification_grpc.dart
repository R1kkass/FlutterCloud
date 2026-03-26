import 'package:TalkSpace/grpc/base_grpc.dart';
import 'package:TalkSpace/gen/dart/notification/notification.pbgrpc.dart';
import 'package:TalkSpace/grpc/interceptors/auth_interceptor.dart';
import 'package:grpc/grpc.dart';

class NotificationGrpc extends BaseGrpc {
  late final _stub = NotificationGreeterClient(channel, interceptors: [AuthInterceptor()]);

  ResponseStream<NotificationMessage> getNotification() {
    return _stub.getNotification(Empty(), options: options);
  }
}
