//
//  Generated code. Do not modify.
//  source: access.proto
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

import 'access.pb.dart' as $0;

export 'access.pb.dart';

@$pb.GrpcServiceName('access.AccessGreeter')
class AccessGreeterClient extends $grpc.Client {
  static final _$createAccess = $grpc.ClientMethod<$0.RequestAccess, $0.ResponseAccess>(
      '/access.AccessGreeter/CreateAccess',
      ($0.RequestAccess value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResponseAccess.fromBuffer(value));
  static final _$getAccesses = $grpc.ClientMethod<$0.Empty, $0.GetAccessesResponse>(
      '/access.AccessGreeter/GetAccesses',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAccessesResponse.fromBuffer(value));

  AccessGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ResponseAccess> createAccess($0.RequestAccess request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccess, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAccessesResponse> getAccesses($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccesses, request, options: options);
  }
}

@$pb.GrpcServiceName('access.AccessGreeter')
abstract class AccessGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'access.AccessGreeter';

  AccessGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RequestAccess, $0.ResponseAccess>(
        'CreateAccess',
        createAccess_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestAccess.fromBuffer(value),
        ($0.ResponseAccess value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetAccessesResponse>(
        'GetAccesses',
        getAccesses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetAccessesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ResponseAccess> createAccess_Pre($grpc.ServiceCall call, $async.Future<$0.RequestAccess> request) async {
    return createAccess(call, await request);
  }

  $async.Future<$0.GetAccessesResponse> getAccesses_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAccesses(call, await request);
  }

  $async.Future<$0.ResponseAccess> createAccess($grpc.ServiceCall call, $0.RequestAccess request);
  $async.Future<$0.GetAccessesResponse> getAccesses($grpc.ServiceCall call, $0.Empty request);
}
