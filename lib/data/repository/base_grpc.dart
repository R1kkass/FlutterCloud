import 'dart:async';

import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/data/repository/auth_grpc.dart';
import 'package:TalkSpace/data/sources/local/session_local_data_source.dart';
import 'package:TalkSpace/domain/exceptions/refresh_token_exception.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:rxdart/rxdart.dart';

class BaseGrpc {
  @protected
  ClientChannel channel = ClientChannel(
    ipServer,
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final _authGrpc = AuthGrpc(
    sessionLocalDataSource: SessionLocalDataSource()
  );

  @protected
  Future<StreamSubscription<T>> listen<T>(ResponseStream<T> stream, void Function(T)? onData) async {
    StreamSubscription<T> retryStream = RetryStream(
      () => stream,
      2
    ).listen((data) {
      onData!(data);
    }, onError: (e, s) async {
        if (e.code == StatusCode.unauthenticated && HiveBoxes.listToken.get(jwtDecode().email) != null) {
          await _authGrpc.refresh();
        }
      }
    );

    return retryStream;
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
      } on RefreshTokenException catch (e) {
        var context = NavigationService.navigatorKey.currentContext!;
        Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (e) => true);
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
