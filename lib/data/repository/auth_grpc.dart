import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/data/repository/keys_grpc.dart';
import 'package:TalkSpace/data/sources/local/chat_secret_keys_local_data_source.dart';
import 'package:TalkSpace/data/sources/local/session_local_data_source.dart';
import 'package:TalkSpace/domain/exceptions/many_attempts_submit_mail.dart';
import 'package:TalkSpace/domain/exceptions/refresh_token_exception.dart';
import 'package:TalkSpace/domain/model/response/common/with__status_message.dart';
import 'package:TalkSpace/domain/repository/auth_repository.dart';
import 'package:TalkSpace/domain/model/entities/session.dart' as session;
import 'package:TalkSpace/domain/model/request/auth/index.dart' as authRequest;
import 'package:TalkSpace/domain/model/response/auth/index.dart' as authResponse;
import 'package:TalkSpace/gen/dart/auth/auth.pbgrpc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
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

class AuthGrpc implements AuthRepository {
  ClientChannel channel = ClientChannel(
    ipServer,
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure(), connectTimeout: Duration(minutes: 1)),
  );
  late final _stub = AuthGreetClient(channel);
  final _deviceManager = DeviceNameManager();

  SessionLocalDataSource sessionLocalDataSource;

  AuthGrpc({
    required this.sessionLocalDataSource,
  });

  @override
  Future<void> registration(authRequest.RegistrationRequest request) async {
    var secretKey = await _getSecretKeys();
    var password = encrypt(request.password, secretKey);
    var email = encrypt(request.email, secretKey);
    var name = encrypt(request.name, secretKey);
    await _stub.registration(RegistrationRequest(
      email: email,
      password: password,
      name: name,
    ));
    return;
  }

  Future<String> _getSecretKeys() async {
    var keys = await dHConnect();

    var A = await generatePubKeyAuth(keys.p, keys.g.toInt());
    var secretKey = await generateSecretKeyAuth(keys.b, keys.p, A.a);
    await dHSecondConnect(A.A.toString());
    secretKey = secretKey.substring(0, 32);

    return secretKey;
  }

  @override
  Future<authResponse.LoginResponse> login(authRequest.LoginRequest request) async {
    var operationSystem = Platform.operatingSystem;
    var secretKey = await _getSecretKeys();
    final firebaseManager = FirebaseManager();
    String? notificationToken = await firebaseManager.notificationToken;

    var passwordHash = encrypt(request.password, secretKey);
    var emailHash = encrypt(request.email, secretKey);
    operationSystem = encrypt(operationSystem, secretKey);
    var nameDevice = encrypt(await _deviceManager.getDeviceName(), secretKey);
    notificationToken = encrypt(notificationToken ?? "", secretKey);

    var loginResp = await _stub.login(LoginRequest(
      email: emailHash,
      password: passwordHash,
      nameDevice: nameDevice,
      operationSystem: operationSystem,
      notificationToken: notificationToken
    ));

    await _afterLogin(
      AfterLoginDTO(
          password: request.password,
          email: request.email,
          accessToken: loginResp.accessToken,
          refreshToken: loginResp.refreshToken,
          sessionId: loginResp.sessionId,
          secretKey: secretKey
      )
    );

    return authResponse.LoginResponse(
      accessToken: loginResp.accessToken,
      refreshToken: loginResp.refreshToken,
      sessionId: loginResp.sessionId
    );
  }

  _afterLogin(AfterLoginDTO afterLoginDTO) async {
    var secretKey = afterLoginDTO.secretKey;
    var accessToken = decrypt(afterLoginDTO.accessToken, secretKey);
    var refreshToken = decrypt(afterLoginDTO.refreshToken, secretKey);
    var sessionId = decrypt(afterLoginDTO.sessionId, secretKey);

    await HiveBoxes.token.put('access_token', accessToken);

    List<int> bytes = utf8.encode(afterLoginDTO.password);
    String hash = sha256.convert(bytes).toString();
    await sessionLocalDataSource.addSession(afterLoginDTO.email, session.Session(sessionId: sessionId, refreshToken: refreshToken, email: afterLoginDTO.email, passwordHash: hash.substring(0, 32)));
    await HiveBoxes.token.put('password', hash.substring(0, 32));
    await KeysGrpc(chatSecretKeysLocalDataSource: ChatSecretKeysLocalDataSource()).getKeys();
  }

  @override
  Future<authResponse.DHConnectResponse> dHConnect() async {
    var response = await retry(() => _stub.dHConnect(DHConnectRequest()));

    return authResponse.DHConnectResponse(
      b: response.b,
      g: response.g.toInt(),
      p: response.p
    );
  }

  @override
  Future<WithStatusMessage> dHSecondConnect(String a) async {
    var resp = await retry(() => _stub.dHSecondConnect(DHSecondConnectRequest(
        a: a
    )));
    return WithStatusMessage(message: resp.message);
  }

  @override
  Future<void> checkAuth() async {
    await _stub.checkAuth(Empty());
  }

  @override
  Future<authResponse.LoginResponse> submitEmail(authRequest.SubmitEmailRequest request) async {
    try {
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

      await _afterLogin(
          AfterLoginDTO(
              password: request.password,
              email: request.email,
              accessToken: response.accessToken,
              refreshToken: response.refreshToken,
              sessionId: response.sessionId,
              secretKey: secretKey
          )
      );

      return authResponse.LoginResponse(
        sessionId: decrypt(response.sessionId, secretKey),
        refreshToken: decrypt(response.refreshToken, secretKey),
        accessToken: decrypt(response.accessToken, secretKey),
      );
    } on GrpcError catch (e) {
      if (e.code == StatusCode.cancelled) {
        throw ManyAttemptsSubmitMail(message: "Many attempts");
      }
      rethrow;
    }
  }

  @override
  Future<void> sendNewMailKeyResponse(String email, String password) async {
    var secretKey = await _getSecretKeys();
    var passwordHash = encrypt(password, secretKey);
    var emailHash = encrypt(email, secretKey);

    await retry(() => _stub.sendNewMailKey(SendNewMailKeyRequest(
      password: passwordHash,
      email: emailHash
    )));
  }

  @override
  Future<void> logout(String email, session.Session session) async {
    try {
      var secretKey = await _getSecretKeys();

      var refreshToken = encrypt(session.refreshToken, secretKey);
      var sessionId = encrypt(session.sessionId, secretKey);

      await retry(() => _stub.logout(LogoutRequest(
        refreshToken: refreshToken,
        sessionId: sessionId,
      )));

      await HiveBoxes.listToken.delete(email);
      return;
    } on GrpcError catch(e) {
      if (e.code == StatusCode.notFound) {
        await HiveBoxes.listToken.delete(email);
        return;
      }
      rethrow;
    }
  }

  @override
  Future<String?> refresh({
    session.Session? session,
  }) async {
    var secretKey = await _getSecretKeys();
    session = session ?? sessionLocalDataSource.getCurrentSession();
    if (session == null) {
      throw RefreshTokenException(code: 1, message:"Session not found");
    }
    try {
      var refreshToken = encrypt(session.refreshToken, secretKey);
      var sessionId = encrypt(session.sessionId, secretKey);

      var response = await _stub.refresh(RefreshRequest(refreshToken: refreshToken, sessionId: sessionId));
      var accessToken = decrypt(response.accessToken, secretKey);

      await HiveBoxes.token.put('access_token', accessToken);
      await HiveBoxes.token.put('password', session.passwordHash);
      return response.accessToken;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unauthenticated) {
        await logoutFromCurrent();
        throw RefreshTokenException(code: e.code, message: e.message);
      }
      rethrow;
    }
  }

  @override
  logoutFromCurrent() async {
    var session = sessionLocalDataSource.getCurrentSession();

    await logout(jwtDecode().email, session!);
  }

  Future<StreamSubscription<T>> listen<T>(ResponseStream<T>? stream, void Function(T)? onData) async {
    if (stream == null) {
      throw Exception("stream null");
    }

    try {
      var s = stream.listen(onData);
      return s;
    } on GrpcError catch(e) {
      if (e.code == StatusCode.unauthenticated && sessionLocalDataSource.getCurrentSession() != null) {
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
      } on RefreshTokenException catch (e) {
        if (e.code == StatusCode.unauthenticated) {
          var context = NavigationService.navigatorKey.currentContext!;
          Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (e) => true);
        }
        rethrow;
      }
    }

    return result;
  }

  @override
  List<session.Session> getSavedSessions() {
    return sessionLocalDataSource.getSavedSessions();
  }

  @override
  Future<String?> changeUser(session.Session session) async {
    return await refresh(session: session);
  }
}
