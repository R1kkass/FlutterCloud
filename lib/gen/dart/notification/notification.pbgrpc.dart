//
//  Generated code. Do not modify.
//  source: notification/notification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'notification.pb.dart' as $0;

export 'notification.pb.dart';

@$pb.GrpcServiceName('notification.NotificationGreeter')
class NotificationGreeterClient extends $grpc.Client {
  static final _$getNotification = $grpc.ClientMethod<$0.Empty, $0.NotificationMessage>(
      '/notification.NotificationGreeter/GetNotification',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.NotificationMessage.fromBuffer(value));

  NotificationGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.NotificationMessage> getNotification($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getNotification, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('notification.NotificationGreeter')
abstract class NotificationGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'notification.NotificationGreeter';

  NotificationGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.NotificationMessage>(
        'GetNotification',
        getNotification_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.NotificationMessage value) => value.writeToBuffer()));
  }

  $async.Stream<$0.NotificationMessage> getNotification_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* getNotification(call, await request);
  }

  $async.Stream<$0.NotificationMessage> getNotification($grpc.ServiceCall call, $0.Empty request);
}
