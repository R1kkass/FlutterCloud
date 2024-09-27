import 'package:flutter_application_2/proto/auth/auth.pbgrpc.dart';
import 'package:flutter_application_2/main.dart';

final stub = AuthGreetClient(channel);

Future<RegistrationResponse> registration(RegistrationRequest request) {
  return stub.registration(request);
}

Future<LoginResponse> login(LoginRequest request) {
  return stub.login(request);
}

Future<DHConnectResponse> dHConnect(DHConnectRequest request) {
  return stub.dHConnect(request);
}

Future<DHSecondConnectResponse> dHSecondConnect(DHSecondConnectRequest request) {
  return stub.dHSecondConnect(request);
}