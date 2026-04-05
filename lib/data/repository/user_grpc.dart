import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/gen/dart/user/user.pbgrpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';

class UserGrpc extends BaseGrpc {
  late final _stub = UsersGreetClient(channel, interceptors: [AuthInterceptor()]);

  Future<GetUserResponse> getUsers(GetUserRequest args) async {
    return retry(() => _stub.getUsers(args));
  }
}
