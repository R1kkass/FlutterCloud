import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/proto/users/users.pbgrpc.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:grpc/grpc.dart';

class UserGrpc {
  final _stub = UsersGreetClient(channel);
  CallOptions get _options {
    return CallOptions(metadata: {
      "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
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
