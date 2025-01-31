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
  static final _$findFile = $grpc.ClientMethod<$0.FindFileRequest, $0.FindFileResponse>(
      '/files.FilesGreeter/FindFile',
      ($0.FindFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FindFileResponse.fromBuffer(value));
  static final _$deleteFile = $grpc.ClientMethod<$0.DeleteFileRequest, $0.DeleteFileResponse>(
      '/files.FilesGreeter/DeleteFile',
      ($0.DeleteFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteFileResponse.fromBuffer(value));
  static final _$renameFile = $grpc.ClientMethod<$0.RenameFileRequest, $0.RenameFileResponse>(
      '/files.FilesGreeter/RenameFile',
      ($0.RenameFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RenameFileResponse.fromBuffer(value));
  static final _$moveFile = $grpc.ClientMethod<$0.MoveFileRequest, $0.MoveFileResponse>(
      '/files.FilesGreeter/MoveFile',
      ($0.MoveFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MoveFileResponse.fromBuffer(value));
  static final _$getSpace = $grpc.ClientMethod<$0.GetSpaceRequest, $0.GetSpaceResponse>(
      '/files.FilesGreeter/GetSpace',
      ($0.GetSpaceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSpaceResponse.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.FindFileResponse> findFile($0.FindFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteFileResponse> deleteFile($0.DeleteFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.RenameFileResponse> renameFile($0.RenameFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.MoveFileResponse> moveFile($0.MoveFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$moveFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSpaceResponse> getSpace($0.GetSpaceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSpace, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.FindFileRequest, $0.FindFileResponse>(
        'FindFile',
        findFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FindFileRequest.fromBuffer(value),
        ($0.FindFileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteFileRequest, $0.DeleteFileResponse>(
        'DeleteFile',
        deleteFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteFileRequest.fromBuffer(value),
        ($0.DeleteFileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RenameFileRequest, $0.RenameFileResponse>(
        'RenameFile',
        renameFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RenameFileRequest.fromBuffer(value),
        ($0.RenameFileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MoveFileRequest, $0.MoveFileResponse>(
        'MoveFile',
        moveFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MoveFileRequest.fromBuffer(value),
        ($0.MoveFileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSpaceRequest, $0.GetSpaceResponse>(
        'GetSpace',
        getSpace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSpaceRequest.fromBuffer(value),
        ($0.GetSpaceResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.FileDownloadResponse> downloadFile_Pre($grpc.ServiceCall call, $async.Future<$0.FileDownloadRequest> request) async* {
    yield* downloadFile(call, await request);
  }

  $async.Future<$0.FindFileResponse> findFile_Pre($grpc.ServiceCall call, $async.Future<$0.FindFileRequest> request) async {
    return findFile(call, await request);
  }

  $async.Future<$0.DeleteFileResponse> deleteFile_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteFileRequest> request) async {
    return deleteFile(call, await request);
  }

  $async.Future<$0.RenameFileResponse> renameFile_Pre($grpc.ServiceCall call, $async.Future<$0.RenameFileRequest> request) async {
    return renameFile(call, await request);
  }

  $async.Future<$0.MoveFileResponse> moveFile_Pre($grpc.ServiceCall call, $async.Future<$0.MoveFileRequest> request) async {
    return moveFile(call, await request);
  }

  $async.Future<$0.GetSpaceResponse> getSpace_Pre($grpc.ServiceCall call, $async.Future<$0.GetSpaceRequest> request) async {
    return getSpace(call, await request);
  }

  $async.Future<$0.FileUploadResponse> uploadFile($grpc.ServiceCall call, $async.Stream<$0.FileUploadRequest> request);
  $async.Stream<$0.FileDownloadResponse> downloadFile($grpc.ServiceCall call, $0.FileDownloadRequest request);
  $async.Future<$0.FindFileResponse> findFile($grpc.ServiceCall call, $0.FindFileRequest request);
  $async.Future<$0.DeleteFileResponse> deleteFile($grpc.ServiceCall call, $0.DeleteFileRequest request);
  $async.Future<$0.RenameFileResponse> renameFile($grpc.ServiceCall call, $0.RenameFileRequest request);
  $async.Future<$0.MoveFileResponse> moveFile($grpc.ServiceCall call, $0.MoveFileRequest request);
  $async.Future<$0.GetSpaceResponse> getSpace($grpc.ServiceCall call, $0.GetSpaceRequest request);
}
