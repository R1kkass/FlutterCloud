import 'dart:convert';
import 'dart:io';

import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/gen/dart/auth/auth.pbgrpc.dart';
import 'package:TalkSpace/grpc/base_grpc.dart';
import 'package:TalkSpace/grpc/keys_grpc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/services/device_name_manager.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/firebase_manager.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';

class AuthGrpc extends BaseGrpc {
  late final _stub = AuthGreetClient(channel);
  final _keysGrpc = KeysGrpc();
  final _deviceManager = DeviceNameManager();
  final _firebaseManager = FirebaseManager();

  Future<RegistrationResponse> registration(RegistrationRequest request) {
    return _stub.registration(request);
  }

  Future<String> _getSecretKeys() async {
    DHConnectResponse keys = await dHConnect(DHConnectRequest());

    var A = await generatePubKeyAuth(keys.p, keys.g.toInt());
    var secretKey = await generateSecretKeyAuth(keys.b, keys.p, A.a);
    await dHSecondConnect(DHSecondConnectRequest(a: A.A.toString()));
    secretKey = secretKey.substring(0, 32);

    return secretKey;
  }

  Future<LoginResponse> login(LoginRequest request) async {
    var operationSystem = Platform.operatingSystem;
    var secretKey = await _getSecretKeys();

    var passwordHash = encrypt(request.password, secretKey);
    var emailHash = encrypt(request.email, secretKey);
    operationSystem = encrypt(operationSystem, secretKey);
    var nameDevice = encrypt(await _deviceManager.getDeviceName(), secretKey);
    var notificationToken = encrypt(await _firebaseManager.notificationToken ?? "", secretKey);

    var loginResp = await _stub
        .login(LoginRequest(
    email: emailHash,
    password: passwordHash,
    nameDevice: nameDevice,
    operationSystem: operationSystem,
    notificationToken: notificationToken
    ));
    var accessToken = decrypt(loginResp.accessToken, secretKey);
    var refreshToken = decrypt(loginResp.refreshToken, secretKey);
    var sessionId = decrypt(loginResp.sessionId, secretKey);

    await HiveBoxes.token.put('access_token', accessToken);
    await HiveBoxes.listToken.put(request.email, Session(sessionId: sessionId, refreshToken: refreshToken));

    List<int> bytes = utf8.encode(request.password);
    String hash = sha256.convert(bytes).toString();
    await HiveBoxes.token.put('password', hash.substring(0, 32));
    await _keysGrpc.getKeys();

    return loginResp;
  }

  Future<DHConnectResponse> dHConnect(DHConnectRequest request) {
    return _stub.dHConnect(request);
  }

  Future<DHSecondConnectResponse> dHSecondConnect(
      DHSecondConnectRequest request) {
    return _stub.dHSecondConnect(request);
  }

  Future<Empty> checkAuth() {
    return _stub.checkAuth(Empty(), options: options);
  }

  Future<SubmitEmailResponse> submitEmail(SubmitEmailRequest request) async {
    var secretKey = await _getSecretKeys();
    var response = await _stub.submitEmail(request);

    return SubmitEmailResponse(
      sessionId: decrypt(response.sessionId, secretKey),
      refreshToken: decrypt(response.refreshToken, secretKey),
      accessToken: decrypt(response.accessToken, secretKey),
    );
  }

  Future<SendNewMailKeyResponse> sendNewMailKeyResponse(
      SendNewMailKeyRequest request) {
    return _stub.sendNewMailKey(request);
  }

  Future<LogoutResponse> logout(String email, Session session) async {
    var secretKey = await _getSecretKeys();

    var refreshToken = encrypt(session.refreshToken, secretKey);
    var sessionId = encrypt(session.sessionId, secretKey);

    var response = await _stub.logout(LogoutRequest(
      refreshToken: refreshToken,
      sessionId: sessionId,
    ));

    await HiveBoxes.listToken.delete(email);
    return response;
  }

  Future<RefreshResponse?> refresh() async {
    final context = NavigationService.navigatorKey.currentContext!;
    var secretKey = await _getSecretKeys();
    final session = HiveBoxes.listToken.get(jwtDecode().email)!;
    try {
      var refreshToken = encrypt(session.refreshToken, secretKey);
      var sessionId = encrypt(session.sessionId, secretKey);

      var response = await _stub.refresh(RefreshRequest(refreshToken: refreshToken, sessionId: sessionId));
      var accessToken = decrypt(response.accessToken, secretKey);

      await HiveBoxes.token.put('access_token', accessToken);
      context.read<TokenCubit>().updateToken(accessToken);

      return response;
    } on GrpcError catch (e) {
      await logout(jwtDecode().email, session);
      await HiveBoxes.token.delete('access_token');
      context.read<TokenCubit>().updateToken("");
    }
    return null;
  }
}
