import 'package:flutter_application_2/consts/domen.dart';
import 'package:flutter_application_2/proto/users/users.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

final channel = ClientChannel(
  ipServer,
  port: 50051,
  options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
);
final stub = UsersGreetClient(channel);
var options = CallOptions(metadata: {
  "authorization": "Bearer ${Hive.box('token').get('access_token')}",
});

Future<GetUsersResponse> getUsers(GetUsersRequest args) async {
  GetUsersResponse response = await stub.getUsers(args, options: options);

  return response;
}

Future<GetContentUserResponse> getContentUsers(
    GetContentUserRequest args) async {
  GetContentUserResponse response =
      await stub.getContentUser(args, options: options);

  return response;
}