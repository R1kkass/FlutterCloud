//
//  Generated code. Do not modify.
//  source: keys.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FileUploadRequest extends $pb.GeneratedMessage {
  factory FileUploadRequest({
    $core.List<$core.int>? chunk,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    return $result;
  }
  FileUploadRequest._() : super();
  factory FileUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'keys'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadRequest clone() => FileUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadRequest copyWith(void Function(FileUploadRequest) updates) => super.copyWith((message) => updates(message as FileUploadRequest)) as FileUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileUploadRequest create() => FileUploadRequest._();
  FileUploadRequest createEmptyInstance() => create();
  static $pb.PbList<FileUploadRequest> createRepeated() => $pb.PbList<FileUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static FileUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadRequest>(create);
  static FileUploadRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(2)
  set chunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(2)
  void clearChunk() => clearField(2);
}

class FileUploadResponse extends $pb.GeneratedMessage {
  factory FileUploadResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  FileUploadResponse._() : super();
  factory FileUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileUploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'keys'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadResponse clone() => FileUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadResponse copyWith(void Function(FileUploadResponse) updates) => super.copyWith((message) => updates(message as FileUploadResponse)) as FileUploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileUploadResponse create() => FileUploadResponse._();
  FileUploadResponse createEmptyInstance() => create();
  static $pb.PbList<FileUploadResponse> createRepeated() => $pb.PbList<FileUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static FileUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadResponse>(create);
  static FileUploadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'keys'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class FileDownloadResponse extends $pb.GeneratedMessage {
  factory FileDownloadResponse({
    $core.List<$core.int>? chunk,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    return $result;
  }
  FileDownloadResponse._() : super();
  factory FileDownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileDownloadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'keys'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileDownloadResponse clone() => FileDownloadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileDownloadResponse copyWith(void Function(FileDownloadResponse) updates) => super.copyWith((message) => updates(message as FileDownloadResponse)) as FileDownloadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileDownloadResponse create() => FileDownloadResponse._();
  FileDownloadResponse createEmptyInstance() => create();
  static $pb.PbList<FileDownloadResponse> createRepeated() => $pb.PbList<FileDownloadResponse>();
  @$core.pragma('dart2js:noInline')
  static FileDownloadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileDownloadResponse>(create);
  static FileDownloadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
