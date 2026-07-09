//
//  Generated code. Do not modify.
//  source: message/message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../chat/chat.pb.dart' as $1;

class UploadFileMessageRequest extends $pb.GeneratedMessage {
  factory UploadFileMessageRequest({
    $core.List<$core.int>? chunk,
    $core.String? fileName,
    $core.int? chatId,
    $core.String? text,
    $core.bool? fileUploaded,
    $core.int? messageId,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (chatId != null) {
      $result.chatId = chatId;
    }
    if (text != null) {
      $result.text = text;
    }
    if (fileUploaded != null) {
      $result.fileUploaded = fileUploaded;
    }
    if (messageId != null) {
      $result.messageId = messageId;
    }
    return $result;
  }
  UploadFileMessageRequest._() : super();
  factory UploadFileMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadFileMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadFileMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'fileName', protoName: 'fileName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3, protoName: 'chatId')
    ..aOS(4, _omitFieldNames ? '' : 'text')
    ..aOB(5, _omitFieldNames ? '' : 'fileUploaded', protoName: 'fileUploaded')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'messageId', $pb.PbFieldType.OU3, protoName: 'messageId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadFileMessageRequest clone() => UploadFileMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadFileMessageRequest copyWith(void Function(UploadFileMessageRequest) updates) => super.copyWith((message) => updates(message as UploadFileMessageRequest)) as UploadFileMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadFileMessageRequest create() => UploadFileMessageRequest._();
  UploadFileMessageRequest createEmptyInstance() => create();
  static $pb.PbList<UploadFileMessageRequest> createRepeated() => $pb.PbList<UploadFileMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadFileMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadFileMessageRequest>(create);
  static UploadFileMessageRequest? _defaultInstance;

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
  $core.int get chatId => $_getIZ(2);
  @$pb.TagNumber(3)
  set chatId($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get text => $_getSZ(3);
  @$pb.TagNumber(4)
  set text($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get fileUploaded => $_getBF(4);
  @$pb.TagNumber(5)
  set fileUploaded($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileUploaded() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileUploaded() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get messageId => $_getIZ(5);
  @$pb.TagNumber(6)
  set messageId($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMessageId() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessageId() => clearField(6);
}

class UploadFileMessageResponse extends $pb.GeneratedMessage {
  factory UploadFileMessageResponse({
    $1.Message? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  UploadFileMessageResponse._() : super();
  factory UploadFileMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadFileMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadFileMessageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aOM<$1.Message>(1, _omitFieldNames ? '' : 'message', subBuilder: $1.Message.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadFileMessageResponse clone() => UploadFileMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadFileMessageResponse copyWith(void Function(UploadFileMessageResponse) updates) => super.copyWith((message) => updates(message as UploadFileMessageResponse)) as UploadFileMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadFileMessageResponse create() => UploadFileMessageResponse._();
  UploadFileMessageResponse createEmptyInstance() => create();
  static $pb.PbList<UploadFileMessageResponse> createRepeated() => $pb.PbList<UploadFileMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadFileMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadFileMessageResponse>(create);
  static UploadFileMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($1.Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  $1.Message ensureMessage() => $_ensure(0);
}

class DownloadFileMessageRequest extends $pb.GeneratedMessage {
  factory DownloadFileMessageRequest({
    $core.int? messageFileId,
    $core.int? messageId,
    $core.int? chatId,
  }) {
    final $result = create();
    if (messageFileId != null) {
      $result.messageFileId = messageFileId;
    }
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (chatId != null) {
      $result.chatId = chatId;
    }
    return $result;
  }
  DownloadFileMessageRequest._() : super();
  factory DownloadFileMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadFileMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadFileMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'messageFileId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'messageId', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadFileMessageRequest clone() => DownloadFileMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadFileMessageRequest copyWith(void Function(DownloadFileMessageRequest) updates) => super.copyWith((message) => updates(message as DownloadFileMessageRequest)) as DownloadFileMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadFileMessageRequest create() => DownloadFileMessageRequest._();
  DownloadFileMessageRequest createEmptyInstance() => create();
  static $pb.PbList<DownloadFileMessageRequest> createRepeated() => $pb.PbList<DownloadFileMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static DownloadFileMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadFileMessageRequest>(create);
  static DownloadFileMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get messageFileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set messageFileId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageFileId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get messageId => $_getIZ(1);
  @$pb.TagNumber(2)
  set messageId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get chatId => $_getIZ(2);
  @$pb.TagNumber(3)
  set chatId($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatId() => clearField(3);
}

class DownloadFileMessageResponse extends $pb.GeneratedMessage {
  factory DownloadFileMessageResponse({
    $core.List<$core.int>? chunk,
    $core.double? progress,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    if (progress != null) {
      $result.progress = progress;
    }
    return $result;
  }
  DownloadFileMessageResponse._() : super();
  factory DownloadFileMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadFileMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadFileMessageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'progress', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadFileMessageResponse clone() => DownloadFileMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadFileMessageResponse copyWith(void Function(DownloadFileMessageResponse) updates) => super.copyWith((message) => updates(message as DownloadFileMessageResponse)) as DownloadFileMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadFileMessageResponse create() => DownloadFileMessageResponse._();
  DownloadFileMessageResponse createEmptyInstance() => create();
  static $pb.PbList<DownloadFileMessageResponse> createRepeated() => $pb.PbList<DownloadFileMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static DownloadFileMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadFileMessageResponse>(create);
  static DownloadFileMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get progress => $_getN(1);
  @$pb.TagNumber(2)
  set progress($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProgress() => $_has(1);
  @$pb.TagNumber(2)
  void clearProgress() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
