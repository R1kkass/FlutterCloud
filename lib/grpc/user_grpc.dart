import 'package:TalkSpace/grpc/base_grpc.dart';
import 'package:TalkSpace/gen/dart/user/user.pbgrpc.dart';
import 'package:TalkSpace/grpc/interceptors/auth_interceptor.dart';

class UserGrpc extends BaseGrpc {
  late final _stub = UsersGreetClient(channel, interceptors: [AuthInterceptor()]);

  Future<GetUserResponse> getUsers(GetUserRequest args) async {
    GetUserResponse response = await _stub.getUsers(args, options: options);

    return response;
  }
}
