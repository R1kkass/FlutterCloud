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

import 'package:protobuf/protobuf.dart' as $pb;

class TypeMessage extends $pb.ProtobufEnum {
  static const TypeMessage SEND_MESSAGE = TypeMessage._(0, _omitEnumNames ? '' : 'SEND_MESSAGE');
  static const TypeMessage READ_MESSAGE = TypeMessage._(1, _omitEnumNames ? '' : 'READ_MESSAGE');
  static const TypeMessage UPLOAD_MESSAGE = TypeMessage._(2, _omitEnumNames ? '' : 'UPLOAD_MESSAGE');
  static const TypeMessage READ_MESSAGE_ALL = TypeMessage._(3, _omitEnumNames ? '' : 'READ_MESSAGE_ALL');

  static const $core.List<TypeMessage> values = <TypeMessage> [
    SEND_MESSAGE,
    READ_MESSAGE,
    UPLOAD_MESSAGE,
    READ_MESSAGE_ALL,
  ];

  static final $core.Map<$core.int, TypeMessage> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TypeMessage? valueOf($core.int value) => _byValue[value];

  const TypeMessage._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
