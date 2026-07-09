import 'package:TalkSpace/domain/model/entities/session.dart';
import 'package:TalkSpace/domain/model/request/auth/index.dart';
import 'package:TalkSpace/domain/model/response/auth/index.dart';
import 'package:TalkSpace/domain/model/response/common/with__status_message.dart';

abstract class AuthRepository {
  Future<void> registration(RegistrationRequest request);
  Future<LoginResponse> login(LoginRequest request);
  Future<DHConnectResponse> dHConnect();
  Future<WithStatusMessage> dHSecondConnect(String a);
  Future<void> checkAuth();
  Future<LoginResponse> submitEmail(SubmitEmailRequest request);
  Future<void> sendNewMailKeyResponse(String email, String password);
  Future<void> logout(String email, Session session);
  Future<String?> refresh();
  logoutFromCurrent();
  List<Session> getSavedSessions();
  Future<String?> changeUser(Session session);
}


