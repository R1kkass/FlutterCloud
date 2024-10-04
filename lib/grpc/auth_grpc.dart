import 'package:flutter_application_2/proto/auth/auth.pbgrpc.dart';
import 'package:flutter_application_2/main.dart';

class AuthGrpc {
  final _stub = AuthGreetClient(channel);

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
}
