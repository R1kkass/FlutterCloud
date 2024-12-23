import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/proto/access/access.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

final stub = AccessGreeterClient(channel);

Future<ResponseAccess> createAccess(RequestAccess args) async {
  var options = CallOptions(metadata: {
    "authorization": "Bearer ${Hive.box('token').get('access_token')}",
  });
  ResponseAccess response = await stub.createAccess(args, options: options);

  return response;
}

Future<GetAccessesResponse> getAccess(Empty args) async {
  var options = CallOptions(metadata: {
    "authorization": "Bearer ${Hive.box('token').get('access_token')}",
  });
  GetAccessesResponse response = await stub.getAccesses(args, options: options);

  return response;
}
