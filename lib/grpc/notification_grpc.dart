import 'dart:developer';

import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/notification/notification.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class NotificationGrpc {
  final _stub = NotificationGreeterClient(channel);
  CallOptions get _options {
    log(token.toString());

    return CallOptions(metadata: {
      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVhc3l0ZWthQGdtYWlsLmNvbSIsImV4cCI6MTcyODczMzk2OH0.xERK4fzFhNJeBhvplmwEIgp_PXN9YVm-kJWonN2RYVI",
    });
  }

  ResponseStream<NotificationMessage> getNotification() {
    return _stub.getNotification(Empty(), options: _options);
  }
}
