import 'dart:async';

import 'package:TalkSpace/services/index.dart';
import 'package:grpc/grpc.dart';

class AuthInterceptor implements ClientInterceptor {
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

    return invoker(method, requests, newOptions);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request, CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    var newOptions = options.mergedWith(
        CallOptions(metadata: {
          "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
        })
    );

    return invoker(method, request, newOptions);
  }
}
