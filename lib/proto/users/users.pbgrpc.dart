//
//  Generated code. Do not modify.
//  source: users.proto
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

import 'users.pb.dart' as $0;

export 'users.pb.dart';

@$pb.GrpcServiceName('users.UsersGreet')
class UsersGreetClient extends $grpc.Client {
  static final _$getUsers = $grpc.ClientMethod<$0.GetUsersRequest, $0.GetUsersResponse>(
      '/users.UsersGreet/GetUsers',
      ($0.GetUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUsersResponse.fromBuffer(value));
  static final _$getContentUser = $grpc.ClientMethod<$0.GetContentUserRequest, $0.GetContentUserResponse>(
      '/users.UsersGreet/GetContentUser',
      ($0.GetContentUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetContentUserResponse.fromBuffer(value));

  UsersGreetClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetUsersResponse> getUsers($0.GetUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetContentUserResponse> getContentUser($0.GetContentUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getContentUser, request, options: options);
  }
}

@$pb.GrpcServiceName('users.UsersGreet')
abstract class UsersGreetServiceBase extends $grpc.Service {
  $core.String get $name => 'users.UsersGreet';

  UsersGreetServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUsersRequest, $0.GetUsersResponse>(
        'GetUsers',
        getUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUsersRequest.fromBuffer(value),
        ($0.GetUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetContentUserRequest, $0.GetContentUserResponse>(
        'GetContentUser',
        getContentUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetContentUserRequest.fromBuffer(value),
        ($0.GetContentUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUsersResponse> getUsers_Pre($grpc.ServiceCall call, $async.Future<$0.GetUsersRequest> request) async {
    return getUsers(call, await request);
  }

  $async.Future<$0.GetContentUserResponse> getContentUser_Pre($grpc.ServiceCall call, $async.Future<$0.GetContentUserRequest> request) async {
    return getContentUser(call, await request);
  }

  $async.Future<$0.GetUsersResponse> getUsers($grpc.ServiceCall call, $0.GetUsersRequest request);
  $async.Future<$0.GetContentUserResponse> getContentUser($grpc.ServiceCall call, $0.GetContentUserRequest request);
}
