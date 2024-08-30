import 'package:hive/hive.dart';
import 'package:jwt_decode/jwt_decode.dart';

class JwtPayload {
  const JwtPayload({required this.email});

  final email;
}

JwtPayload jwtDecode() {
  var token = Hive.box('token').get('access_token');
  var jwtDecode = Jwt.parseJwt(token);
  
  return JwtPayload(email: jwtDecode["email"]);
}