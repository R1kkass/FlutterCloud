//
//  Generated code. Do not modify.
//  source: auth.proto
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

import 'auth.pb.dart' as $0;

export 'auth.pb.dart';

@$pb.GrpcServiceName('auth.AuthGreet')
class AuthGreetClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/auth.AuthGreet/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$registration = $grpc.ClientMethod<$0.RegistrationRequest, $0.RegistrationResponse>(
      '/auth.AuthGreet/Registration',
      ($0.RegistrationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RegistrationResponse.fromBuffer(value));
  static final _$dHConnect = $grpc.ClientMethod<$0.DHConnectRequest, $0.DHConnectResponse>(
      '/auth.AuthGreet/DHConnect',
      ($0.DHConnectRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DHConnectResponse.fromBuffer(value));
  static final _$dHSecondConnect = $grpc.ClientMethod<$0.DHSecondConnectRequest, $0.DHSecondConnectResponse>(
      '/auth.AuthGreet/DHSecondConnect',
      ($0.DHSecondConnectRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DHSecondConnectResponse.fromBuffer(value));

  AuthGreetClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegistrationResponse> registration($0.RegistrationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registration, request, options: options);
  }

  $grpc.ResponseFuture<$0.DHConnectResponse> dHConnect($0.DHConnectRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dHConnect, request, options: options);
  }

  $grpc.ResponseFuture<$0.DHSecondConnectResponse> dHSecondConnect($0.DHSecondConnectRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dHSecondConnect, request, options: options);
  }
}

@$pb.GrpcServiceName('auth.AuthGreet')
abstract class AuthGreetServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.AuthGreet';

  AuthGreetServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegistrationRequest, $0.RegistrationResponse>(
        'Registration',
        registration_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegistrationRequest.fromBuffer(value),
        ($0.RegistrationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DHConnectRequest, $0.DHConnectResponse>(
        'DHConnect',
        dHConnect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DHConnectRequest.fromBuffer(value),
        ($0.DHConnectResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DHSecondConnectRequest, $0.DHSecondConnectResponse>(
        'DHSecondConnect',
        dHSecondConnect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DHSecondConnectRequest.fromBuffer(value),
        ($0.DHSecondConnectResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> login_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.RegistrationResponse> registration_Pre($grpc.ServiceCall call, $async.Future<$0.RegistrationRequest> request) async {
    return registration(call, await request);
  }

  $async.Future<$0.DHConnectResponse> dHConnect_Pre($grpc.ServiceCall call, $async.Future<$0.DHConnectRequest> request) async {
    return dHConnect(call, await request);
  }

  $async.Future<$0.DHSecondConnectResponse> dHSecondConnect_Pre($grpc.ServiceCall call, $async.Future<$0.DHSecondConnectRequest> request) async {
    return dHSecondConnect(call, await request);
  }

  $async.Future<$0.LoginResponse> login($grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.RegistrationResponse> registration($grpc.ServiceCall call, $0.RegistrationRequest request);
  $async.Future<$0.DHConnectResponse> dHConnect($grpc.ServiceCall call, $0.DHConnectRequest request);
  $async.Future<$0.DHSecondConnectResponse> dHSecondConnect($grpc.ServiceCall call, $0.DHSecondConnectRequest request);
}
