import 'package:flutter_application_2/consts/domen.dart';
import 'package:http/http.dart' as http;

class AuthParams {
  String? email;
  String? password;
  AuthParams(this.email, this.password);
}

class RegisterParams extends AuthParams {
  String? name;
  RegisterParams(super.email, super.password, this.name);
}

Future<http.Response> registration(RegisterParams body) async {
  return await http.post(Uri.parse('$domain/registration'), body: {
    "email": body.email,
    "password": body.password,
    "name": body.name,
  }, headers: {
    "X-CSRF-token": csrf,
  });
}

Future<http.Response> login(AuthParams body) async {
  return await http.post(Uri.parse('$domain/login'), body: {
    "email": body.email,
    "password": body.password,
  });
}
