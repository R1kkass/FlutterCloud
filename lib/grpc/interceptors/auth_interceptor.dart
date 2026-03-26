import 'dart:async';

import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

class AuthInterceptor implements ClientInterceptor {
  final _authGrpc = AuthGrpc();

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker,
      ) {
    var newOptions = options.mergedWith(
        CallOptions(metadata: {
          "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
        })
    );

    requests = requests.handleError((e, _) {
      if (e.code == StatusCode.unauthenticated && HiveBoxes.listToken.get(jwtDecode().email) != null) {
        _authGrpc.refresh();
        return invoker(method, requests, newOptions);
      }
    });

    return invoker(method, requests, newOptions);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request, CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    var newOptions = options.mergedWith(
        CallOptions(metadata: {
          "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
        })
    );

    var response = invoker(method, request, newOptions);
    var context = NavigationService.navigatorKey.currentContext!;
    response.catchError((e) async {
      if (e.code == StatusCode.unauthenticated && HiveBoxes.listToken.get(jwtDecode().email) != null) {
        await _authGrpc.refresh();
        return await invoker(method, request, newOptions).catchError(() {
          Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (r) => true);

          throw Exception(e);
        });
      }
      throw Exception(e);
    });

    return response;
  }
}
