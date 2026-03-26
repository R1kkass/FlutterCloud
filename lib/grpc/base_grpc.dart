import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

class BaseGrpc {
  @protected
  CallOptions get options => CallOptions(metadata: {
    "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
  });

  ClientChannel channel = ClientChannel(
    ipServer,
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
}