//
//  Generated code. Do not modify.
//  source: files/files.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class FileUploadRequest extends $pb.GeneratedMessage {
  factory FileUploadRequest({
    $core.List<$core.int>? chunk,
    $core.String? fileName,
    $core.int? folderId,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    return $result;
  }
  FileUploadRequest._() : super();
  factory FileUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'files'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'fileName', protoName: 'fileName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.OU3, protoName: 'folderId')
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

  @$pb.TagNumber(1)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get folderId => $_getIZ(2);
  @$pb.TagNumber(3)
  set folderId($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFolderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFolderId() => clearField(3);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileUploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'files'), createEmptyInstance: create)
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

class FileDownloadRequest extends $pb.GeneratedMessage {
  factory FileDownloadRequest({
    $core.int? fileId,
    $core.int? folderId,
  }) {
    final $result = create();
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    return $result;
  }
  FileDownloadRequest._() : super();
  factory FileDownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileDownloadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'files'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.OU3, protoName: 'fileId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.OU3, protoName: 'folderId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileDownloadRequest clone() => FileDownloadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileDownloadRequest copyWith(void Function(FileDownloadRequest) updates) => super.copyWith((message) => updates(message as FileDownloadRequest)) as FileDownloadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileDownloadRequest create() => FileDownloadRequest._();
  FileDownloadRequest createEmptyInstance() => create();
  static $pb.PbList<FileDownloadRequest> createRepeated() => $pb.PbList<FileDownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static FileDownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileDownloadRequest>(create);
  static FileDownloadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fileId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get folderId => $_getIZ(1);
  @$pb.TagNumber(2)
  set folderId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderId() => clearField(2);
}

class FileDownloadResponse extends $pb.GeneratedMessage {
  factory FileDownloadResponse({
    $core.List<$core.int>? chunk,
    $core.String? fileName,
    $core.double? progress,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (progress != null) {
      $result.progress = progress;
    }
    return $result;
  }
  FileDownloadResponse._() : super();
  factory FileDownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileDownloadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'files'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'fileName', protoName: 'fileName')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'progress', $pb.PbFieldType.OF)
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

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get progress => $_getN(2);
  @$pb.TagNumber(3)
  set progress($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearProgress() => clearField(3);
}

class FindFileRequest extends $pb.GeneratedMessage {
  factory FindFileRequest({
    $core.String? search,
    $core.int? folderId,
    $core.bool? findEveryWhere,
    $core.int? page,
  }) {
    final $result = create();
    if (search != null) {
      $result.search = search;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (findEveryWhere != null) {
      $result.findEveryWhere = findEveryWhere;
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  FindFileRequest._() : super();
  factory FindFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'files'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'search')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.OU3, protoName: 'folderId')
    ..aOB(3, _omitFieldNames ? '' : 'findEveryWhere', protoName: 'findEveryWhere')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'page', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindFileRequest clone() => FindFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindFileRequest copyWith(void Function(FindFileRequest) updates) => super.copyWith((message) => updates(message as FindFileRequest)) as FindFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindFileRequest create() => FindFileRequest._();
  FindFileRequest createEmptyInstance() => create();
  static $pb.PbList<FindFileRequest> createRepeated() => $pb.PbList<FindFileRequest>();
  @$core.pragma('dart2js:noInline')
  static FindFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindFileRequest>(create);
  static FindFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get search => $_getSZ(0);
  @$pb.TagNumber(1)
  set search($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSearch() => $_has(0);
  @$pb.TagNumber(1)
  void clearSearch() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get folderId => $_getIZ(1);
  @$pb.TagNumber(2)
  set folderId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get findEveryWhere => $_getBF(2);
  @$pb.TagNumber(3)
  set findEveryWhere($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFindEveryWhere() => $_has(2);
  @$pb.TagNumber(3)
  void clearFindEveryWhere() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get page => $_getIZ(3);
  @$pb.TagNumber(4)
  set page($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => clearField(4);
}

class FindFileResponse extends $pb.GeneratedMessage {
  factory FindFileResponse({
    $core.Iterable<FileFind>? files,
    $core.Iterable<FolderFind>? folders,
  }) {
    final $result = create();
    if (files != null) {
      $result.files.addAll(files);
    }
    if (folders != null) {
      $result.folders.addAll(folders);
    }
    return $result;
  }
  FindFileResponse._() : super();
  factory FindFileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindFileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindFileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'files'), createEmptyInstance: create)
    ..pc<FileFind>(1, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM, subBuilder: FileFind.create)
    ..pc<FolderFind>(2, _omitFieldNames ? '' : 'folders', $pb.PbFieldType.PM, subBuilder: FolderFind.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindFileResponse clone() => FindFileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindFileResponse copyWith(void Function(FindFileResponse) updates) => super.copyWith((message) => updates(message as FindFileResponse)) as FindFileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindFileResponse create() => FindFileResponse._();
  FindFileResponse createEmptyInstance() => create();
  static $pb.PbList<FindFileResponse> createRepeated() => $pb.PbList<FindFileResponse>();
  @$core.pragma('dart2js:noInline')
  static FindFileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindFileResponse>(create);
  static FindFileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FileFind> get files => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<FolderFind> get folders => $_getList(1);
}

class FileFind extends $pb.GeneratedMessage {
  factory FileFind({
    $core.int? id,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.int? userId,
    $core.int? folderId,
    $fixnum.Int64? size,
    $core.String? fileName,
    $core.String? fileNameHash,
    $core.int? accessId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (size != null) {
      $result.size = size;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (fileNameHash != null) {
      $result.fileNameHash = fileNameHash;
    }
    if (accessId != null) {
      $result.accessId = accessId;
    }
    return $result;
  }
  FileFind._() : super();
  factory FileFind.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileFind.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileFind', package: const $pb.PackageName(_omitMessageNames ? '' : 'files'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'createdAt')
    ..aOS(3, _omitFieldNames ? '' : 'updatedAt')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3)
    ..aInt64(6, _omitFieldNames ? '' : 'size')
    ..aOS(7, _omitFieldNames ? '' : 'fileName')
    ..aOS(8, _omitFieldNames ? '' : 'fileNameHash')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'accessId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileFind clone() => FileFind()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileFind copyWith(void Function(FileFind) updates) => super.copyWith((message) => updates(message as FileFind)) as FileFind;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileFind create() => FileFind._();
  FileFind createEmptyInstance() => create();
  static $pb.PbList<FileFind> createRepeated() => $pb.PbList<FileFind>();
  @$core.pragma('dart2js:noInline')
  static FileFind getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileFind>(create);
  static FileFind? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get createdAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set createdAt($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get updatedAt => $_getSZ(2);
  @$pb.TagNumber(3)
  set updatedAt($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get folderId => $_getIZ(4);
  @$pb.TagNumber(5)
  set folderId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFolderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolderId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get size => $_getI64(5);
  @$pb.TagNumber(6)
  set size($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearSize() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get fileName => $_getSZ(6);
  @$pb.TagNumber(7)
  set fileName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFileName() => $_has(6);
  @$pb.TagNumber(7)
  void clearFileName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get fileNameHash => $_getSZ(7);
  @$pb.TagNumber(8)
  set fileNameHash($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFileNameHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearFileNameHash() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get accessId => $_getIZ(8);
  @$pb.TagNumber(9)
  set accessId($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAccessId() => $_has(8);
  @$pb.TagNumber(9)
  void clearAccessId() => clearField(9);
}

class FolderFind extends $pb.GeneratedMessage {
  factory FolderFind({
    $core.int? id,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.int? userId,
    $core.int? folderId,
    $core.int? accessId,
    $core.String? nameFolder,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (accessId != null) {
      $result.accessId = accessId;
    }
    if (nameFolder != null) {
      $result.nameFolder = nameFolder;
    }
    return $result;
  }
  FolderFind._() : super();
  factory FolderFind.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FolderFind.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FolderFind', package: const $pb.PackageName(_omitMessageNames ? '' : 'files'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'createdAt')
    ..aOS(3, _omitFieldNames ? '' : 'updatedAt')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'accessId', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'nameFolder')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FolderFind clone() => FolderFind()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FolderFind copyWith(void Function(FolderFind) updates) => super.copyWith((message) => updates(message as FolderFind)) as FolderFind;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FolderFind create() => FolderFind._();
  FolderFind createEmptyInstance() => create();
  static $pb.PbList<FolderFind> createRepeated() => $pb.PbList<FolderFind>();
  @$core.pragma('dart2js:noInline')
  static FolderFind getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FolderFind>(create);
  static FolderFind? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get createdAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set createdAt($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get updatedAt => $_getSZ(2);
  @$pb.TagNumber(3)
  set updatedAt($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get folderId => $_getIZ(4);
  @$pb.TagNumber(5)
  set folderId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFolderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolderId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get accessId => $_getIZ(5);
  @$pb.TagNumber(6)
  set accessId($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAccessId() => $_has(5);
  @$pb.TagNumber(6)
  void clearAccessId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get nameFolder => $_getSZ(6);
  @$pb.TagNumber(7)
  set nameFolder($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNameFolder() => $_has(6);
  @$pb.TagNumber(7)
  void clearNameFolder() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
