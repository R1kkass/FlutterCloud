import 'package:TalkSpace/domain/exceptions/refresh_token_exception.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:jwt_decode/jwt_decode.dart';

class JwtPayload {
  const JwtPayload({required this.email});

  final email;
}

JwtPayload jwtDecode() {
  var token = HiveBoxes.token.get('access_token');
  if (token == null) {
    throw RefreshTokenException(code: 1, message: "Access token not found");
  }

  var jwtDecode = Jwt.parseJwt(token);

  return JwtPayload(email: jwtDecode["email"]);
}
