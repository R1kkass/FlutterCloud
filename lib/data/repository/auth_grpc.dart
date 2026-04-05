import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/gen/dart/auth/auth.pbgrpc.dart';
import 'package:TalkSpace/data/repository/keys_grpc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/services/device_name_manager.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/firebase_manager.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';

class AfterLoginDTO {
  String email;
  String password;
  String accessToken;
  String refreshToken;
  String sessionId;
  String secretKey;

  AfterLoginDTO({
    required this.password,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.sessionId,
    required this.secretKey,
  });
}

class AuthGrpc {
  ClientChannel channel = ClientChannel(
    ipServer,
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure(), connectTimeout: Duration(minutes: 1)),
  );
  late final _stub = AuthGreetClient(channel);
  final _deviceManager = DeviceNameManager();

  Future<RegistrationResponse> registration(RegistrationRequest request) async {
    var secretKey = await _getSecretKeys();
    request.password = encrypt(request.password, secretKey);
    request.email = encrypt(request.email, secretKey);
    request.name = encrypt(request.name, secretKey);
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
    final firebaseManager = FirebaseManager();

    var passwordHash = encrypt(request.password, secretKey);
    var emailHash = encrypt(request.email, secretKey);
    operationSystem = encrypt(operationSystem, secretKey);
    var nameDevice = encrypt(await _deviceManager.getDeviceName(), secretKey);
    var notificationToken = encrypt(await firebaseManager.notificationToken ?? "", secretKey);

    var loginResp = await _stub
        .login(LoginRequest(
      email: emailHash,
      password: passwordHash,
      nameDevice: nameDevice,
      operationSystem: operationSystem,
      notificationToken: notificationToken
    ));

    await afterLogin(
      AfterLoginDTO(
          password: request.password,
          email: request.email,
          accessToken: loginResp.accessToken,
          refreshToken: loginResp.refreshToken,
          sessionId: loginResp.sessionId,
          secretKey: secretKey
      )
    );

    return loginResp;
  }

  afterLogin(AfterLoginDTO afterLoginDTO) async {
    var secretKey = afterLoginDTO.secretKey;
    var accessToken = decrypt(afterLoginDTO.accessToken, secretKey);
    var refreshToken = decrypt(afterLoginDTO.refreshToken, secretKey);
    var sessionId = decrypt(afterLoginDTO.sessionId, secretKey);

    await HiveBoxes.token.put('access_token', accessToken);
    await HiveBoxes.listToken.put(afterLoginDTO.email, Session(sessionId: sessionId, refreshToken: refreshToken));

    List<int> bytes = utf8.encode(afterLoginDTO.password);
    String hash = sha256.convert(bytes).toString();
    await HiveBoxes.token.put('password', hash.substring(0, 32));
    await KeysGrpc().getKeys();
    var context = NavigationService.navigatorKey.currentContext!;
    context.read<TokenCubit>().updateToken(accessToken);
  }

  Future<DHConnectResponse> dHConnect(DHConnectRequest request) {
    return retry(() => _stub.dHConnect(request));
  }

  Future<DHSecondConnectResponse> dHSecondConnect(
      DHSecondConnectRequest request) {
    return retry(() => _stub.dHSecondConnect(request));
  }

  Future<Empty> checkAuth() {
    return _stub.checkAuth(Empty());
  }

  Future<SubmitEmailResponse> submitEmail(SubmitEmailRequest request) async {
    var secretKey = await _getSecretKeys();
    var operationSystem = Platform.operatingSystem;
    final firebaseManager = FirebaseManager();

    var passwordHash = encrypt(request.password, secretKey);
    var emailHash = encrypt(request.email, secretKey);
    var key = encrypt(request.key, secretKey);
    operationSystem = encrypt(operationSystem, secretKey);
    var nameDevice = encrypt(await _deviceManager.getDeviceName(), secretKey);
    var notificationToken = encrypt(await firebaseManager.notificationToken ?? "", secretKey);

    var response = await _stub.submitEmail(SubmitEmailRequest(
      notificationToken: notificationToken,
      password: passwordHash,
      email: emailHash,
      nameDevice: nameDevice,
      operationSystem: operationSystem,
      key: key,
    ));

    await afterLogin(
        AfterLoginDTO(
            password: request.password,
            email: request.email,
            accessToken: response.accessToken,
            refreshToken: response.refreshToken,
            sessionId: response.sessionId,
            secretKey: secretKey
        )
    );

    return SubmitEmailResponse(
      sessionId: decrypt(response.sessionId, secretKey),
      refreshToken: decrypt(response.refreshToken, secretKey),
      accessToken: decrypt(response.accessToken, secretKey),
    );
  }

  Future<SendNewMailKeyResponse> sendNewMailKeyResponse(
      SendNewMailKeyRequest request) {
    return retry(() => _stub.sendNewMailKey(request));
  }

  Future<LogoutResponse> logout(String email, Session session) async {
    try {
      var secretKey = await _getSecretKeys();

      var refreshToken = encrypt(session.refreshToken, secretKey);
      var sessionId = encrypt(session.sessionId, secretKey);

      var response = await retry(() => _stub.logout(LogoutRequest(
        refreshToken: refreshToken,
        sessionId: sessionId,
      )));

      await HiveBoxes.listToken.delete(email);
      return response;
    } on GrpcError catch(e) {
      if (e.code == StatusCode.notFound) {
        await HiveBoxes.listToken.delete(email);
      }
      rethrow;
    }
  }

  Future<RefreshResponse?> refresh() async {
    final context = NavigationService.navigatorKey.currentContext!;
    var secretKey = await _getSecretKeys();
    final session = HiveBoxes.listToken.get(jwtDecode().email);
    if (session == null) {
      throw Exception("Session not found");
    }
    try {
      var refreshToken = encrypt(session.refreshToken, secretKey);
      var sessionId = encrypt(session.sessionId, secretKey);

      var response = await _stub.refresh(RefreshRequest(refreshToken: refreshToken, sessionId: sessionId));
      var accessToken = decrypt(response.accessToken, secretKey);

      await HiveBoxes.token.put('access_token', accessToken);
      context.read<TokenCubit>().updateToken(accessToken);
      return response;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unauthenticated) {
        await logoutFromCurrent(session);
        return null;
      }
      rethrow;
    }
  }

  logoutFromCurrent(Session session) async {
    final context = NavigationService.navigatorKey.currentContext!;
    try {
      await logout(jwtDecode().email, session);
      context.read<TokenCubit>().updateToken(null);
      Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (_) => false);
    } on GrpcError catch(e) {
      if (e.code == StatusCode.notFound) {
        context.read<TokenCubit>().updateToken(null);
        Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (_) => false);
      }
      rethrow;
    }
  }

  Future<StreamSubscription<T>> listen<T>(ResponseStream<T>? stream, void Function(T)? onData) async {
    if (stream == null) {
      throw Exception("stream null");
    }

    try {
      var s = stream.listen(onData);
      return s;
    } on GrpcError catch(e) {
      if (e.code == StatusCode.unauthenticated && HiveBoxes.listToken.get(jwtDecode().email) != null) {
        await refresh();
        return stream.listen(onData);
      }
      rethrow;
    }
  }

  @protected
  Future<R> retry<R>(Future<R> Function() fn) async {
    R result;
    try {
      result = await fn();
    } on GrpcError catch (e) {
      try {
        if (e.code == StatusCode.unauthenticated) {
          await refresh();
          result = await fn();
        }
        rethrow;
      } on GrpcError catch (e) {
        if (e.code == StatusCode.unauthenticated) {
          var context = NavigationService.navigatorKey.currentContext!;
          Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (e) => true);
        }
        rethrow;
      }
    }

    return result;
  }
}
