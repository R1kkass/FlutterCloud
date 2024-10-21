import 'package:flutter_application_2/proto/auth/auth.pbgrpc.dart';
import 'package:flutter_application_2/main.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthGrpc {
  final _stub = AuthGreetClient(channel);

  CallOptions get _options => CallOptions(metadata: {
        "authorization": "Bearer ${Hive.box('token').get('access_token')}",
      });

  Future<RegistrationResponse> registration(RegistrationRequest request) {
    return _stub.registration(request);
  }

  Future<LoginResponse> login(LoginRequest request) {
    return _stub.login(request);
  }

  Future<DHConnectResponse> dHConnect(DHConnectRequest request) {
    return _stub.dHConnect(request);
  }

  Future<DHSecondConnectResponse> dHSecondConnect(
      DHSecondConnectRequest request) {
    return _stub.dHSecondConnect(request);
  }

  Future<Empty> checkAuth() {
    return _stub.checkAuth(Empty(), options: _options);
  }
}
