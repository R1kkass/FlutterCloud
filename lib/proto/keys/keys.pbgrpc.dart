//
//  Generated code. Do not modify.
//  source: keys.proto
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

import 'keys.pb.dart' as $0;

export 'keys.pb.dart';

@$pb.GrpcServiceName('keys.KeysGreeter')
class KeysGreeterClient extends $grpc.Client {
  static final _$uploadKeys = $grpc.ClientMethod<$0.FileUploadRequest, $0.FileUploadResponse>(
      '/keys.KeysGreeter/UploadKeys',
      ($0.FileUploadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileUploadResponse.fromBuffer(value));
  static final _$downloadKeys = $grpc.ClientMethod<$0.Empty, $0.FileDownloadResponse>(
      '/keys.KeysGreeter/DownloadKeys',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileDownloadResponse.fromBuffer(value));

  KeysGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.FileUploadResponse> uploadKeys($0.FileUploadRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$uploadKeys, request, options: options);
  }

  $grpc.ResponseStream<$0.FileDownloadResponse> downloadKeys($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$downloadKeys, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('keys.KeysGreeter')
abstract class KeysGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'keys.KeysGreeter';

  KeysGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FileUploadRequest, $0.FileUploadResponse>(
        'UploadKeys',
        uploadKeys_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileUploadRequest.fromBuffer(value),
        ($0.FileUploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.FileDownloadResponse>(
        'DownloadKeys',
        downloadKeys_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.FileDownloadResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FileUploadResponse> uploadKeys_Pre($grpc.ServiceCall call, $async.Future<$0.FileUploadRequest> request) async {
    return uploadKeys(call, await request);
  }

  $async.Stream<$0.FileDownloadResponse> downloadKeys_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* downloadKeys(call, await request);
  }

  $async.Future<$0.FileUploadResponse> uploadKeys($grpc.ServiceCall call, $0.FileUploadRequest request);
  $async.Stream<$0.FileDownloadResponse> downloadKeys($grpc.ServiceCall call, $0.Empty request);
}
