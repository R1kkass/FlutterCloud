import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

Future<http.Response> get(Uri url, BuildContext context,
    {Map<String, String>? headers}) async {
  var response = await http.get(url, headers: headers);
  if (response.statusCode == 401) {
    var box = Hive.box("token");
    box.delete("access_token");
    Navigator.pushNamed(context, AUTH);
  }
  return response;
}

Future<http.Response> post(Uri url, BuildContext context,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  var response =
      await http.post(url, headers: headers, body: body, encoding: encoding);
  if (response.statusCode == 401) {
    var box = Hive.box("token");
    box.delete("access_token");
    context.read<TokenCubit>().updateToken("");
    Navigator.pushNamed(context, AUTH);
  }
  return response;
}

Future<http.Response> patch(Uri url, BuildContext context,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  var response =
      await http.patch(url, headers: headers, body: body, encoding: encoding);
  if (response.statusCode == 401) {
    var box = Hive.box("token");
    box.delete("access_token");
    context.read<TokenCubit>().updateToken("");
    Navigator.pushNamed(context, AUTH);
  }
  return response;
}

Future<http.Response> put(Uri url, BuildContext context,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  var response =
      await http.put(url, headers: headers, body: body, encoding: encoding);
  if (response.statusCode == 401) {
    var box = Hive.box("token");
    box.delete("access_token");
    context.read<TokenCubit>().updateToken("");
    Navigator.pushNamed(context, AUTH);
  }
  return response;
}

Future<http.Response> delete(Uri url, BuildContext context,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  var response =
      await http.delete(url, headers: headers, body: body, encoding: encoding);
  if (response.statusCode == 401) {
    var box = Hive.box("token");
    box.delete("access_token");
    context.read<TokenCubit>().updateToken("");
    Navigator.pushNamed(context, AUTH);
  }
  return response;
}
