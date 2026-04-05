import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:jwt_decode/jwt_decode.dart';

class JwtPayload {
  const JwtPayload({required this.email});

  final email;
}

JwtPayload jwtDecode() {
  var token = HiveBoxes.token.get('access_token');
  if (token == null) {
    throw Exception("Access token not found");
  }

  var jwtDecode = Jwt.parseJwt(token);

  return JwtPayload(email: jwtDecode["email"]);
}
