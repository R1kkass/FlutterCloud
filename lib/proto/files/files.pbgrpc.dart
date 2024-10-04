//
//  Generated code. Do not modify.
//  source: files/files.proto
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

import 'files.pb.dart' as $0;

export 'files.pb.dart';

@$pb.GrpcServiceName('files.FilesGreeter')
class FilesGreeterClient extends $grpc.Client {
  static final _$uploadFile = $grpc.ClientMethod<$0.FileUploadRequest, $0.FileUploadResponse>(
      '/files.FilesGreeter/UploadFile',
      ($0.FileUploadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileUploadResponse.fromBuffer(value));
  static final _$downloadFile = $grpc.ClientMethod<$0.FileDownloadRequest, $0.FileDownloadResponse>(
      '/files.FilesGreeter/DownloadFile',
      ($0.FileDownloadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileDownloadResponse.fromBuffer(value));

  FilesGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.FileUploadResponse> uploadFile($async.Stream<$0.FileUploadRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadFile, request, options: options).single;
  }

  $grpc.ResponseStream<$0.FileDownloadResponse> downloadFile($0.FileDownloadRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$downloadFile, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('files.FilesGreeter')
abstract class FilesGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'files.FilesGreeter';

  FilesGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FileUploadRequest, $0.FileUploadResponse>(
        'UploadFile',
        uploadFile,
        true,
        false,
        ($core.List<$core.int> value) => $0.FileUploadRequest.fromBuffer(value),
        ($0.FileUploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileDownloadRequest, $0.FileDownloadResponse>(
        'DownloadFile',
        downloadFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.FileDownloadRequest.fromBuffer(value),
        ($0.FileDownloadResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.FileDownloadResponse> downloadFile_Pre($grpc.ServiceCall call, $async.Future<$0.FileDownloadRequest> request) async* {
    yield* downloadFile(call, await request);
  }

  $async.Future<$0.FileUploadResponse> uploadFile($grpc.ServiceCall call, $async.Stream<$0.FileUploadRequest> request);
  $async.Stream<$0.FileDownloadResponse> downloadFile($grpc.ServiceCall call, $0.FileDownloadRequest request);
}
