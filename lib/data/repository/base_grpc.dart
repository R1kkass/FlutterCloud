import 'dart:async';

import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/data/repository/auth_grpc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

class BaseGrpc {
  @protected
  ClientChannel channel = ClientChannel(
    ipServer,
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final _authGrpc = AuthGrpc();

  @protected
  Future<StreamSubscription<T>> listen<T>(ResponseStream<T>? stream, void Function(T)? onData) async {
    if (stream == null) {
      throw Exception("stream null");
    }

    try {
      var s = stream.listen(onData);
      return s;
    } on GrpcError catch(e) {
      if (e.code == StatusCode.unauthenticated && HiveBoxes.listToken.get(jwtDecode().email) != null) {
        await _authGrpc.refresh();
        return stream.listen(onData);
      }
      rethrow;
    } catch (e) {
      print(e);
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
          await _authGrpc.refresh();
          result = await fn();
          return result;
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

Future<UseFetch> useFetch<T>(Future<T> Function() fn) async {
  var fetch = UseFetch<T>();
  try {
    fetch.isLoading = true;
    fetch.response = await fn();
    fetch.retry = fn;
  } catch (e) {
    fetch.isError = true;
    fetch.error = e;
  } finally {
    fetch.isLoading = false;
  }
  return fetch;
}

class UseFetch<T> {
  bool isLoading = false;
  bool isError = false;
  late Future<T> Function() retry;
  dynamic error;
  late T response;
}
