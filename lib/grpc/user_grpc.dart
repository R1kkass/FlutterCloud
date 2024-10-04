import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/users/users.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class UserGrpc {
  final _stub = UsersGreetClient(channel);
  CallOptions get _options {
    return CallOptions(metadata: {
      "authorization": "Bearer ${Hive.box('token').get('access_token')}",
    });
  }

  Future<GetUsersResponse> getUsers(GetUsersRequest args) async {
    GetUsersResponse response = await _stub.getUsers(args, options: _options);

    return response;
  }

  Future<GetContentUserResponse> getContentUsers(
      GetContentUserRequest args) async {
    GetContentUserResponse response =
        await _stub.getContentUser(args, options: _options);

    return response;
  }
}
