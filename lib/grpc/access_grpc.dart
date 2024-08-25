import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/access/access.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

Future<ResponseAccess> createAccess(RequestAccess args) async {
  final stub = AccessGreeterClient(channel);
  var options = CallOptions(metadata: {
    "authorization": "Bearer ${Hive.box('token').get('access_token')}",
  });
  ResponseAccess response = await stub.createAccess(args, options: options);

  return response;
}

Future<GetAccessesResponse> getAccess(Empty args) async {
  final stub = AccessGreeterClient(channel);
  var options = CallOptions(metadata: {
    "authorization": "Bearer ${Hive.box('token').get('access_token')}",
  });
  GetAccessesResponse response = await stub.getAccesses(args, options: options);

  return response;
}
