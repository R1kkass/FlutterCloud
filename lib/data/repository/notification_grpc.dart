import 'dart:async';

import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/gen/dart/notification/notification.pbgrpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';

class NotificationGrpc extends BaseGrpc {
  late final _stub = NotificationGreeterClient(channel, interceptors: [AuthInterceptor()]);

  Future<StreamSubscription<NotificationMessage>> getNotification(Function(NotificationMessage) onData) async {
    return await listen(_stub.getNotification(Empty()), onData);
  }
}
