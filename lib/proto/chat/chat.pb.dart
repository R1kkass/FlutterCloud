//
//  Generated code. Do not modify.
//  source: chat/chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pbenum.dart';

export 'chat.pbenum.dart';

class StreamGetMessagesRequest extends $pb.GeneratedMessage {
  factory StreamGetMessagesRequest({
    TypeMessage? type,
    $core.String? message,
    $core.int? messageId,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (message != null) {
      $result.message = message;
    }
    if (messageId != null) {
      $result.messageId = messageId;
    }
    return $result;
  }
  StreamGetMessagesRequest._() : super();
  factory StreamGetMessagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamGetMessagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamGetMessagesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..e<TypeMessage>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TypeMessage.SEND_MESSAGE, valueOf: TypeMessage.valueOf, enumValues: TypeMessage.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'messageId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamGetMessagesRequest clone() => StreamGetMessagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamGetMessagesRequest copyWith(void Function(StreamGetMessagesRequest) updates) => super.copyWith((message) => updates(message as StreamGetMessagesRequest)) as StreamGetMessagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamGetMessagesRequest create() => StreamGetMessagesRequest._();
  StreamGetMessagesRequest createEmptyInstance() => create();
  static $pb.PbList<StreamGetMessagesRequest> createRepeated() => $pb.PbList<StreamGetMessagesRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamGetMessagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamGetMessagesRequest>(create);
  static StreamGetMessagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TypeMessage get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(TypeMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get messageId => $_getIZ(2);
  @$pb.TagNumber(3)
  set messageId($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessageId() => clearField(3);
}

class StreamGetMessagesResponse extends $pb.GeneratedMessage {
  factory StreamGetMessagesResponse({
    TypeMessage? type,
    Message? message,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  StreamGetMessagesResponse._() : super();
  factory StreamGetMessagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamGetMessagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamGetMessagesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..e<TypeMessage>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TypeMessage.SEND_MESSAGE, valueOf: TypeMessage.valueOf, enumValues: TypeMessage.values)
    ..aOM<Message>(2, _omitFieldNames ? '' : 'message', subBuilder: Message.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamGetMessagesResponse clone() => StreamGetMessagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamGetMessagesResponse copyWith(void Function(StreamGetMessagesResponse) updates) => super.copyWith((message) => updates(message as StreamGetMessagesResponse)) as StreamGetMessagesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamGetMessagesResponse create() => StreamGetMessagesResponse._();
  StreamGetMessagesResponse createEmptyInstance() => create();
  static $pb.PbList<StreamGetMessagesResponse> createRepeated() => $pb.PbList<StreamGetMessagesResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamGetMessagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamGetMessagesResponse>(create);
  static StreamGetMessagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TypeMessage get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(TypeMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  Message get message => $_getN(1);
  @$pb.TagNumber(2)
  set message(Message v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
  @$pb.TagNumber(2)
  Message ensureMessage() => $_ensure(1);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
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

class StreamGetMessagesGeneralResponse extends $pb.GeneratedMessage {
  factory StreamGetMessagesGeneralResponse({
    $core.int? count,
  }) {
    final $result = create();
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  StreamGetMessagesGeneralResponse._() : super();
  factory StreamGetMessagesGeneralResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamGetMessagesGeneralResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamGetMessagesGeneralResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamGetMessagesGeneralResponse clone() => StreamGetMessagesGeneralResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamGetMessagesGeneralResponse copyWith(void Function(StreamGetMessagesGeneralResponse) updates) => super.copyWith((message) => updates(message as StreamGetMessagesGeneralResponse)) as StreamGetMessagesGeneralResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamGetMessagesGeneralResponse create() => StreamGetMessagesGeneralResponse._();
  StreamGetMessagesGeneralResponse createEmptyInstance() => create();
  static $pb.PbList<StreamGetMessagesGeneralResponse> createRepeated() => $pb.PbList<StreamGetMessagesGeneralResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamGetMessagesGeneralResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamGetMessagesGeneralResponse>(create);
  static StreamGetMessagesGeneralResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);
}

class AcceptChatRequest extends $pb.GeneratedMessage {
  factory AcceptChatRequest({
    $core.int? chatId,
  }) {
    final $result = create();
    if (chatId != null) {
      $result.chatId = chatId;
    }
    return $result;
  }
  AcceptChatRequest._() : super();
  factory AcceptChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AcceptChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AcceptChatRequest clone() => AcceptChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AcceptChatRequest copyWith(void Function(AcceptChatRequest) updates) => super.copyWith((message) => updates(message as AcceptChatRequest)) as AcceptChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptChatRequest create() => AcceptChatRequest._();
  AcceptChatRequest createEmptyInstance() => create();
  static $pb.PbList<AcceptChatRequest> createRepeated() => $pb.PbList<AcceptChatRequest>();
  @$core.pragma('dart2js:noInline')
  static AcceptChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AcceptChatRequest>(create);
  static AcceptChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);
}

class AcceptChatResponse extends $pb.GeneratedMessage {
  factory AcceptChatResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  AcceptChatResponse._() : super();
  factory AcceptChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AcceptChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AcceptChatResponse clone() => AcceptChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AcceptChatResponse copyWith(void Function(AcceptChatResponse) updates) => super.copyWith((message) => updates(message as AcceptChatResponse)) as AcceptChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptChatResponse create() => AcceptChatResponse._();
  AcceptChatResponse createEmptyInstance() => create();
  static $pb.PbList<AcceptChatResponse> createRepeated() => $pb.PbList<AcceptChatResponse>();
  @$core.pragma('dart2js:noInline')
  static AcceptChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AcceptChatResponse>(create);
  static AcceptChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class DissalowChatRequest extends $pb.GeneratedMessage {
  factory DissalowChatRequest({
    $core.int? chatId,
  }) {
    final $result = create();
    if (chatId != null) {
      $result.chatId = chatId;
    }
    return $result;
  }
  DissalowChatRequest._() : super();
  factory DissalowChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DissalowChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DissalowChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DissalowChatRequest clone() => DissalowChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DissalowChatRequest copyWith(void Function(DissalowChatRequest) updates) => super.copyWith((message) => updates(message as DissalowChatRequest)) as DissalowChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DissalowChatRequest create() => DissalowChatRequest._();
  DissalowChatRequest createEmptyInstance() => create();
  static $pb.PbList<DissalowChatRequest> createRepeated() => $pb.PbList<DissalowChatRequest>();
  @$core.pragma('dart2js:noInline')
  static DissalowChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DissalowChatRequest>(create);
  static DissalowChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);
}

class DissalowChatResponse extends $pb.GeneratedMessage {
  factory DissalowChatResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  DissalowChatResponse._() : super();
  factory DissalowChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DissalowChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DissalowChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DissalowChatResponse clone() => DissalowChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DissalowChatResponse copyWith(void Function(DissalowChatResponse) updates) => super.copyWith((message) => updates(message as DissalowChatResponse)) as DissalowChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DissalowChatResponse create() => DissalowChatResponse._();
  DissalowChatResponse createEmptyInstance() => create();
  static $pb.PbList<DissalowChatResponse> createRepeated() => $pb.PbList<DissalowChatResponse>();
  @$core.pragma('dart2js:noInline')
  static DissalowChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DissalowChatResponse>(create);
  static DissalowChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class CreateRequestChat extends $pb.GeneratedMessage {
  factory CreateRequestChat({
    $core.int? otherId,
  }) {
    final $result = create();
    if (otherId != null) {
      $result.otherId = otherId;
    }
    return $result;
  }
  CreateRequestChat._() : super();
  factory CreateRequestChat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRequestChat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRequestChat', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'otherId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRequestChat clone() => CreateRequestChat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRequestChat copyWith(void Function(CreateRequestChat) updates) => super.copyWith((message) => updates(message as CreateRequestChat)) as CreateRequestChat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRequestChat create() => CreateRequestChat._();
  CreateRequestChat createEmptyInstance() => create();
  static $pb.PbList<CreateRequestChat> createRepeated() => $pb.PbList<CreateRequestChat>();
  @$core.pragma('dart2js:noInline')
  static CreateRequestChat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRequestChat>(create);
  static CreateRequestChat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get otherId => $_getIZ(0);
  @$pb.TagNumber(1)
  set otherId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOtherId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOtherId() => clearField(1);
}

class CreateResponseChat extends $pb.GeneratedMessage {
  factory CreateResponseChat({
    $core.String? message,
    Keys? keys,
    $core.int? chatId,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    if (keys != null) {
      $result.keys = keys;
    }
    if (chatId != null) {
      $result.chatId = chatId;
    }
    return $result;
  }
  CreateResponseChat._() : super();
  factory CreateResponseChat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateResponseChat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateResponseChat', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..aOM<Keys>(2, _omitFieldNames ? '' : 'keys', subBuilder: Keys.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateResponseChat clone() => CreateResponseChat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateResponseChat copyWith(void Function(CreateResponseChat) updates) => super.copyWith((message) => updates(message as CreateResponseChat)) as CreateResponseChat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateResponseChat create() => CreateResponseChat._();
  CreateResponseChat createEmptyInstance() => create();
  static $pb.PbList<CreateResponseChat> createRepeated() => $pb.PbList<CreateResponseChat>();
  @$core.pragma('dart2js:noInline')
  static CreateResponseChat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateResponseChat>(create);
  static CreateResponseChat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  Keys get keys => $_getN(1);
  @$pb.TagNumber(2)
  set keys(Keys v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasKeys() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeys() => clearField(2);
  @$pb.TagNumber(2)
  Keys ensureKeys() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get chatId => $_getIZ(2);
  @$pb.TagNumber(3)
  set chatId($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatId() => clearField(3);
}

class Keys extends $pb.GeneratedMessage {
  factory Keys({
    $core.String? p,
    $fixnum.Int64? g,
  }) {
    final $result = create();
    if (p != null) {
      $result.p = p;
    }
    if (g != null) {
      $result.g = g;
    }
    return $result;
  }
  Keys._() : super();
  factory Keys.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Keys.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Keys', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'p')
    ..aInt64(2, _omitFieldNames ? '' : 'g')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Keys clone() => Keys()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Keys copyWith(void Function(Keys) updates) => super.copyWith((message) => updates(message as Keys)) as Keys;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Keys create() => Keys._();
  Keys createEmptyInstance() => create();
  static $pb.PbList<Keys> createRepeated() => $pb.PbList<Keys>();
  @$core.pragma('dart2js:noInline')
  static Keys getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Keys>(create);
  static Keys? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get p => $_getSZ(0);
  @$pb.TagNumber(1)
  set p($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasP() => $_has(0);
  @$pb.TagNumber(1)
  void clearP() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get g => $_getI64(1);
  @$pb.TagNumber(2)
  set g($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasG() => $_has(1);
  @$pb.TagNumber(2)
  void clearG() => clearField(2);
}

class StreamGetResponseChat extends $pb.GeneratedMessage {
  factory StreamGetResponseChat({
    $core.Iterable<ChatUsersCount>? chats,
  }) {
    final $result = create();
    if (chats != null) {
      $result.chats.addAll(chats);
    }
    return $result;
  }
  StreamGetResponseChat._() : super();
  factory StreamGetResponseChat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamGetResponseChat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamGetResponseChat', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<ChatUsersCount>(1, _omitFieldNames ? '' : 'chats', $pb.PbFieldType.PM, subBuilder: ChatUsersCount.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamGetResponseChat clone() => StreamGetResponseChat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamGetResponseChat copyWith(void Function(StreamGetResponseChat) updates) => super.copyWith((message) => updates(message as StreamGetResponseChat)) as StreamGetResponseChat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamGetResponseChat create() => StreamGetResponseChat._();
  StreamGetResponseChat createEmptyInstance() => create();
  static $pb.PbList<StreamGetResponseChat> createRepeated() => $pb.PbList<StreamGetResponseChat>();
  @$core.pragma('dart2js:noInline')
  static StreamGetResponseChat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamGetResponseChat>(create);
  static StreamGetResponseChat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChatUsersCount> get chats => $_getList(0);
}

class GetUnSuccessChatsResponse extends $pb.GeneratedMessage {
  factory GetUnSuccessChatsResponse({
    $core.Iterable<ChatUsers>? chats,
  }) {
    final $result = create();
    if (chats != null) {
      $result.chats.addAll(chats);
    }
    return $result;
  }
  GetUnSuccessChatsResponse._() : super();
  factory GetUnSuccessChatsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUnSuccessChatsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUnSuccessChatsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<ChatUsers>(1, _omitFieldNames ? '' : 'chats', $pb.PbFieldType.PM, subBuilder: ChatUsers.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUnSuccessChatsResponse clone() => GetUnSuccessChatsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUnSuccessChatsResponse copyWith(void Function(GetUnSuccessChatsResponse) updates) => super.copyWith((message) => updates(message as GetUnSuccessChatsResponse)) as GetUnSuccessChatsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUnSuccessChatsResponse create() => GetUnSuccessChatsResponse._();
  GetUnSuccessChatsResponse createEmptyInstance() => create();
  static $pb.PbList<GetUnSuccessChatsResponse> createRepeated() => $pb.PbList<GetUnSuccessChatsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUnSuccessChatsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUnSuccessChatsResponse>(create);
  static GetUnSuccessChatsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChatUsers> get chats => $_getList(0);
}

class ChatUsers extends $pb.GeneratedMessage {
  factory ChatUsers({
    $core.int? id,
    $core.int? chatId,
    $core.int? userId,
    User? user,
    $core.String? createdAt,
    $core.String? updatedAt,
    Chat? chat,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (chatId != null) {
      $result.chatId = chatId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (user != null) {
      $result.user = user;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (chat != null) {
      $result.chat = chat;
    }
    return $result;
  }
  ChatUsers._() : super();
  factory ChatUsers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatUsers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatUsers', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU3)
    ..aOM<User>(4, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..aOS(5, _omitFieldNames ? '' : 'createdAt')
    ..aOS(6, _omitFieldNames ? '' : 'updatedAt')
    ..aOM<Chat>(7, _omitFieldNames ? '' : 'chat', subBuilder: Chat.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatUsers clone() => ChatUsers()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatUsers copyWith(void Function(ChatUsers) updates) => super.copyWith((message) => updates(message as ChatUsers)) as ChatUsers;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatUsers create() => ChatUsers._();
  ChatUsers createEmptyInstance() => create();
  static $pb.PbList<ChatUsers> createRepeated() => $pb.PbList<ChatUsers>();
  @$core.pragma('dart2js:noInline')
  static ChatUsers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatUsers>(create);
  static ChatUsers? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get chatId => $_getIZ(1);
  @$pb.TagNumber(2)
  set chatId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get userId => $_getIZ(2);
  @$pb.TagNumber(3)
  set userId($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  User get user => $_getN(3);
  @$pb.TagNumber(4)
  set user(User v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => clearField(4);
  @$pb.TagNumber(4)
  User ensureUser() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get createdAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set createdAt($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get updatedAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set updatedAt($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => clearField(6);

  @$pb.TagNumber(7)
  Chat get chat => $_getN(6);
  @$pb.TagNumber(7)
  set chat(Chat v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasChat() => $_has(6);
  @$pb.TagNumber(7)
  void clearChat() => clearField(7);
  @$pb.TagNumber(7)
  Chat ensureChat() => $_ensure(6);
}

class ChatUsersCount extends $pb.GeneratedMessage {
  factory ChatUsersCount({
    $core.int? id,
    $core.int? chatId,
    $core.int? userId,
    User? user,
    $core.String? createdAt,
    $core.String? updatedAt,
    Chat? chat,
    $core.int? unReadedMessagesCount,
    $core.String? text,
    $core.String? messageUserId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (chatId != null) {
      $result.chatId = chatId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (user != null) {
      $result.user = user;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (chat != null) {
      $result.chat = chat;
    }
    if (unReadedMessagesCount != null) {
      $result.unReadedMessagesCount = unReadedMessagesCount;
    }
    if (text != null) {
      $result.text = text;
    }
    if (messageUserId != null) {
      $result.messageUserId = messageUserId;
    }
    return $result;
  }
  ChatUsersCount._() : super();
  factory ChatUsersCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatUsersCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatUsersCount', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU3)
    ..aOM<User>(4, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..aOS(5, _omitFieldNames ? '' : 'createdAt')
    ..aOS(6, _omitFieldNames ? '' : 'updatedAt')
    ..aOM<Chat>(7, _omitFieldNames ? '' : 'chat', subBuilder: Chat.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'unReadedMessagesCount', $pb.PbFieldType.O3)
    ..aOS(9, _omitFieldNames ? '' : 'text')
    ..aOS(10, _omitFieldNames ? '' : 'messageUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatUsersCount clone() => ChatUsersCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatUsersCount copyWith(void Function(ChatUsersCount) updates) => super.copyWith((message) => updates(message as ChatUsersCount)) as ChatUsersCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatUsersCount create() => ChatUsersCount._();
  ChatUsersCount createEmptyInstance() => create();
  static $pb.PbList<ChatUsersCount> createRepeated() => $pb.PbList<ChatUsersCount>();
  @$core.pragma('dart2js:noInline')
  static ChatUsersCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatUsersCount>(create);
  static ChatUsersCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get chatId => $_getIZ(1);
  @$pb.TagNumber(2)
  set chatId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get userId => $_getIZ(2);
  @$pb.TagNumber(3)
  set userId($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  User get user => $_getN(3);
  @$pb.TagNumber(4)
  set user(User v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => clearField(4);
  @$pb.TagNumber(4)
  User ensureUser() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get createdAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set createdAt($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get updatedAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set updatedAt($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => clearField(6);

  @$pb.TagNumber(7)
  Chat get chat => $_getN(6);
  @$pb.TagNumber(7)
  set chat(Chat v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasChat() => $_has(6);
  @$pb.TagNumber(7)
  void clearChat() => clearField(7);
  @$pb.TagNumber(7)
  Chat ensureChat() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get unReadedMessagesCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set unReadedMessagesCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUnReadedMessagesCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearUnReadedMessagesCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get text => $_getSZ(8);
  @$pb.TagNumber(9)
  set text($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasText() => $_has(8);
  @$pb.TagNumber(9)
  void clearText() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get messageUserId => $_getSZ(9);
  @$pb.TagNumber(10)
  set messageUserId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMessageUserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearMessageUserId() => clearField(10);
}

class Chat extends $pb.GeneratedMessage {
  factory Chat({
    $core.int? id,
    Message? message,
    $core.String? nameChat,
    $core.Iterable<ChatUsers>? chatUsers,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (message != null) {
      $result.message = message;
    }
    if (nameChat != null) {
      $result.nameChat = nameChat;
    }
    if (chatUsers != null) {
      $result.chatUsers.addAll(chatUsers);
    }
    return $result;
  }
  Chat._() : super();
  factory Chat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Chat', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOM<Message>(2, _omitFieldNames ? '' : 'message', subBuilder: Message.create)
    ..aOS(3, _omitFieldNames ? '' : 'nameChat')
    ..pc<ChatUsers>(4, _omitFieldNames ? '' : 'chatUsers', $pb.PbFieldType.PM, subBuilder: ChatUsers.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chat clone() => Chat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chat copyWith(void Function(Chat) updates) => super.copyWith((message) => updates(message as Chat)) as Chat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chat create() => Chat._();
  Chat createEmptyInstance() => create();
  static $pb.PbList<Chat> createRepeated() => $pb.PbList<Chat>();
  @$core.pragma('dart2js:noInline')
  static Chat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chat>(create);
  static Chat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Message get message => $_getN(1);
  @$pb.TagNumber(2)
  set message(Message v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
  @$pb.TagNumber(2)
  Message ensureMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get nameChat => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameChat($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameChat() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameChat() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<ChatUsers> get chatUsers => $_getList(3);
}

class Message extends $pb.GeneratedMessage {
  factory Message({
    $core.int? id,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.int? userId,
    $core.int? chatId,
    $core.String? text,
    User? user,
    $core.bool? statusRead,
    $core.bool? unReadedMessage,
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
    if (chatId != null) {
      $result.chatId = chatId;
    }
    if (text != null) {
      $result.text = text;
    }
    if (user != null) {
      $result.user = user;
    }
    if (statusRead != null) {
      $result.statusRead = statusRead;
    }
    if (unReadedMessage != null) {
      $result.unReadedMessage = unReadedMessage;
    }
    return $result;
  }
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Message', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'createdAt')
    ..aOS(3, _omitFieldNames ? '' : 'updatedAt')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'text')
    ..aOM<User>(7, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..aOB(8, _omitFieldNames ? '' : 'statusRead')
    ..aOB(9, _omitFieldNames ? '' : 'unReadedMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
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
  set userId($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get chatId => $_getIZ(4);
  @$pb.TagNumber(5)
  set chatId($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChatId() => $_has(4);
  @$pb.TagNumber(5)
  void clearChatId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get text => $_getSZ(5);
  @$pb.TagNumber(6)
  set text($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasText() => $_has(5);
  @$pb.TagNumber(6)
  void clearText() => clearField(6);

  @$pb.TagNumber(7)
  User get user => $_getN(6);
  @$pb.TagNumber(7)
  set user(User v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUser() => $_has(6);
  @$pb.TagNumber(7)
  void clearUser() => clearField(7);
  @$pb.TagNumber(7)
  User ensureUser() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get statusRead => $_getBF(7);
  @$pb.TagNumber(8)
  set statusRead($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatusRead() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatusRead() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get unReadedMessage => $_getBF(8);
  @$pb.TagNumber(9)
  set unReadedMessage($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUnReadedMessage() => $_has(8);
  @$pb.TagNumber(9)
  void clearUnReadedMessage() => clearField(9);
}

class User extends $pb.GeneratedMessage {
  factory User({
    $core.int? id,
    $core.String? name,
    $core.String? email,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'User', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

class CreateSecondaryKeyRequest extends $pb.GeneratedMessage {
  factory CreateSecondaryKeyRequest({
    $core.int? chatId,
    $core.String? key,
  }) {
    final $result = create();
    if (chatId != null) {
      $result.chatId = chatId;
    }
    if (key != null) {
      $result.key = key;
    }
    return $result;
  }
  CreateSecondaryKeyRequest._() : super();
  factory CreateSecondaryKeyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSecondaryKeyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSecondaryKeyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'key')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSecondaryKeyRequest clone() => CreateSecondaryKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSecondaryKeyRequest copyWith(void Function(CreateSecondaryKeyRequest) updates) => super.copyWith((message) => updates(message as CreateSecondaryKeyRequest)) as CreateSecondaryKeyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSecondaryKeyRequest create() => CreateSecondaryKeyRequest._();
  CreateSecondaryKeyRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSecondaryKeyRequest> createRepeated() => $pb.PbList<CreateSecondaryKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSecondaryKeyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSecondaryKeyRequest>(create);
  static CreateSecondaryKeyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);
}

class CreateSecondaryKeyResponse extends $pb.GeneratedMessage {
  factory CreateSecondaryKeyResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  CreateSecondaryKeyResponse._() : super();
  factory CreateSecondaryKeyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSecondaryKeyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSecondaryKeyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSecondaryKeyResponse clone() => CreateSecondaryKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSecondaryKeyResponse copyWith(void Function(CreateSecondaryKeyResponse) updates) => super.copyWith((message) => updates(message as CreateSecondaryKeyResponse)) as CreateSecondaryKeyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSecondaryKeyResponse create() => CreateSecondaryKeyResponse._();
  CreateSecondaryKeyResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSecondaryKeyResponse> createRepeated() => $pb.PbList<CreateSecondaryKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSecondaryKeyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSecondaryKeyResponse>(create);
  static CreateSecondaryKeyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class GetSecondaryKeyRequest extends $pb.GeneratedMessage {
  factory GetSecondaryKeyRequest({
    $core.int? chatId,
  }) {
    final $result = create();
    if (chatId != null) {
      $result.chatId = chatId;
    }
    return $result;
  }
  GetSecondaryKeyRequest._() : super();
  factory GetSecondaryKeyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSecondaryKeyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSecondaryKeyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSecondaryKeyRequest clone() => GetSecondaryKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSecondaryKeyRequest copyWith(void Function(GetSecondaryKeyRequest) updates) => super.copyWith((message) => updates(message as GetSecondaryKeyRequest)) as GetSecondaryKeyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSecondaryKeyRequest create() => GetSecondaryKeyRequest._();
  GetSecondaryKeyRequest createEmptyInstance() => create();
  static $pb.PbList<GetSecondaryKeyRequest> createRepeated() => $pb.PbList<GetSecondaryKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSecondaryKeyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSecondaryKeyRequest>(create);
  static GetSecondaryKeyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);
}

class GetSecondaryKeyResponse extends $pb.GeneratedMessage {
  factory GetSecondaryKeyResponse({
    $core.String? key,
    $core.String? p,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (p != null) {
      $result.p = p;
    }
    return $result;
  }
  GetSecondaryKeyResponse._() : super();
  factory GetSecondaryKeyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSecondaryKeyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSecondaryKeyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..aOS(2, _omitFieldNames ? '' : 'p')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSecondaryKeyResponse clone() => GetSecondaryKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSecondaryKeyResponse copyWith(void Function(GetSecondaryKeyResponse) updates) => super.copyWith((message) => updates(message as GetSecondaryKeyResponse)) as GetSecondaryKeyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSecondaryKeyResponse create() => GetSecondaryKeyResponse._();
  GetSecondaryKeyResponse createEmptyInstance() => create();
  static $pb.PbList<GetSecondaryKeyResponse> createRepeated() => $pb.PbList<GetSecondaryKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSecondaryKeyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSecondaryKeyResponse>(create);
  static GetSecondaryKeyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get p => $_getSZ(1);
  @$pb.TagNumber(2)
  set p($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasP() => $_has(1);
  @$pb.TagNumber(2)
  void clearP() => clearField(2);
}

class GetPublicKeyRequest extends $pb.GeneratedMessage {
  factory GetPublicKeyRequest({
    $core.int? chatId,
  }) {
    final $result = create();
    if (chatId != null) {
      $result.chatId = chatId;
    }
    return $result;
  }
  GetPublicKeyRequest._() : super();
  factory GetPublicKeyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPublicKeyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPublicKeyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPublicKeyRequest clone() => GetPublicKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPublicKeyRequest copyWith(void Function(GetPublicKeyRequest) updates) => super.copyWith((message) => updates(message as GetPublicKeyRequest)) as GetPublicKeyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPublicKeyRequest create() => GetPublicKeyRequest._();
  GetPublicKeyRequest createEmptyInstance() => create();
  static $pb.PbList<GetPublicKeyRequest> createRepeated() => $pb.PbList<GetPublicKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPublicKeyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPublicKeyRequest>(create);
  static GetPublicKeyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);
}

class GetPublicKeyResponse extends $pb.GeneratedMessage {
  factory GetPublicKeyResponse({
    $fixnum.Int64? g,
    $core.String? p,
  }) {
    final $result = create();
    if (g != null) {
      $result.g = g;
    }
    if (p != null) {
      $result.p = p;
    }
    return $result;
  }
  GetPublicKeyResponse._() : super();
  factory GetPublicKeyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPublicKeyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPublicKeyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'g')
    ..aOS(2, _omitFieldNames ? '' : 'p')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPublicKeyResponse clone() => GetPublicKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPublicKeyResponse copyWith(void Function(GetPublicKeyResponse) updates) => super.copyWith((message) => updates(message as GetPublicKeyResponse)) as GetPublicKeyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPublicKeyResponse create() => GetPublicKeyResponse._();
  GetPublicKeyResponse createEmptyInstance() => create();
  static $pb.PbList<GetPublicKeyResponse> createRepeated() => $pb.PbList<GetPublicKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPublicKeyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPublicKeyResponse>(create);
  static GetPublicKeyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get g => $_getI64(0);
  @$pb.TagNumber(1)
  set g($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasG() => $_has(0);
  @$pb.TagNumber(1)
  void clearG() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get p => $_getSZ(1);
  @$pb.TagNumber(2)
  set p($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasP() => $_has(1);
  @$pb.TagNumber(2)
  void clearP() => clearField(2);
}

class GetMessagesRequest extends $pb.GeneratedMessage {
  factory GetMessagesRequest({
    $core.int? chatId,
    $core.int? page,
    $core.bool? init,
  }) {
    final $result = create();
    if (chatId != null) {
      $result.chatId = chatId;
    }
    if (page != null) {
      $result.page = page;
    }
    if (init != null) {
      $result.init = init;
    }
    return $result;
  }
  GetMessagesRequest._() : super();
  factory GetMessagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMessagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMessagesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3, protoName: 'chatId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'init')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMessagesRequest clone() => GetMessagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMessagesRequest copyWith(void Function(GetMessagesRequest) updates) => super.copyWith((message) => updates(message as GetMessagesRequest)) as GetMessagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMessagesRequest create() => GetMessagesRequest._();
  GetMessagesRequest createEmptyInstance() => create();
  static $pb.PbList<GetMessagesRequest> createRepeated() => $pb.PbList<GetMessagesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMessagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMessagesRequest>(create);
  static GetMessagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get init => $_getBF(2);
  @$pb.TagNumber(3)
  set init($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInit() => $_has(2);
  @$pb.TagNumber(3)
  void clearInit() => clearField(3);
}

class GetMessagesResponse extends $pb.GeneratedMessage {
  factory GetMessagesResponse({
    $core.Iterable<Message>? messages,
    $core.int? page,
    $core.int? countNotRead,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    if (page != null) {
      $result.page = page;
    }
    if (countNotRead != null) {
      $result.countNotRead = countNotRead;
    }
    return $result;
  }
  GetMessagesResponse._() : super();
  factory GetMessagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMessagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMessagesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<Message>(1, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: Message.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'countNotRead', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMessagesResponse clone() => GetMessagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMessagesResponse copyWith(void Function(GetMessagesResponse) updates) => super.copyWith((message) => updates(message as GetMessagesResponse)) as GetMessagesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMessagesResponse create() => GetMessagesResponse._();
  GetMessagesResponse createEmptyInstance() => create();
  static $pb.PbList<GetMessagesResponse> createRepeated() => $pb.PbList<GetMessagesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMessagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMessagesResponse>(create);
  static GetMessagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Message> get messages => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get countNotRead => $_getIZ(2);
  @$pb.TagNumber(3)
  set countNotRead($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCountNotRead() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountNotRead() => clearField(3);
}

class UploadFileChat extends $pb.GeneratedMessage {
  factory UploadFileChat({
    $core.List<$core.int>? chunk,
    $core.String? fileName,
    $core.int? chatId,
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
    return $result;
  }
  UploadFileChat._() : super();
  factory UploadFileChat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadFileChat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadFileChat', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'fileName', protoName: 'fileName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU3, protoName: 'chatId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadFileChat clone() => UploadFileChat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadFileChat copyWith(void Function(UploadFileChat) updates) => super.copyWith((message) => updates(message as UploadFileChat)) as UploadFileChat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadFileChat create() => UploadFileChat._();
  UploadFileChat createEmptyInstance() => create();
  static $pb.PbList<UploadFileChat> createRepeated() => $pb.PbList<UploadFileChat>();
  @$core.pragma('dart2js:noInline')
  static UploadFileChat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadFileChat>(create);
  static UploadFileChat? _defaultInstance;

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
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
