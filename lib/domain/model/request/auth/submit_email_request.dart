import 'package:TalkSpace/domain/model/request/auth/login_request.dart';

class SubmitEmailRequest extends LoginRequest {
  String key;

  SubmitEmailRequest({
    required super.email,
    required super.password,
    required this.key,
  });
}
