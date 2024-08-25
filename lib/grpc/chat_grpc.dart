import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

final stub = ChatGreeterClient(channel);

var options = CallOptions(metadata: {
  "authorization": "Bearer ${Hive.box('token').get('access_token')}",
});

Future<CreateResponseChat> createChat(CreateRequestChat args) async {
  CreateResponseChat response = await stub.createChat(args, options: options);
  return response;
}

Future<GetResponseChat> getChat(Empty args) async {
  GetResponseChat response = await stub.getChat(args, options: options);
  return response;
}
