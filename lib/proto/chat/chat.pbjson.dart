//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createRequestChatDescriptor instead')
const CreateRequestChat$json = {
  '1': 'CreateRequestChat',
  '2': [
    {'1': 'other_id', '3': 1, '4': 1, '5': 13, '10': 'otherId'},
  ],
};

/// Descriptor for `CreateRequestChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRequestChatDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVSZXF1ZXN0Q2hhdBIZCghvdGhlcl9pZBgBIAEoDVIHb3RoZXJJZA==');

@$core.Deprecated('Use createResponseChatDescriptor instead')
const CreateResponseChat$json = {
  '1': 'CreateResponseChat',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'keys', '3': 2, '4': 1, '5': 11, '6': '.chat.Keys', '10': 'keys'},
    {'1': 'chat_id', '3': 3, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `CreateResponseChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createResponseChatDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVSZXNwb25zZUNoYXQSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIeCgRrZXlzGA'
    'IgASgLMgouY2hhdC5LZXlzUgRrZXlzEhcKB2NoYXRfaWQYAyABKA1SBmNoYXRJZA==');

@$core.Deprecated('Use keysDescriptor instead')
const Keys$json = {
  '1': 'Keys',
  '2': [
    {'1': 'p', '3': 1, '4': 1, '5': 9, '10': 'p'},
    {'1': 'g', '3': 2, '4': 1, '5': 3, '10': 'g'},
  ],
};

/// Descriptor for `Keys`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keysDescriptor = $convert.base64Decode(
    'CgRLZXlzEgwKAXAYASABKAlSAXASDAoBZxgCIAEoA1IBZw==');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use getResponseChatDescriptor instead')
const GetResponseChat$json = {
  '1': 'GetResponseChat',
  '2': [
    {'1': 'chats', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatUsers', '10': 'chats'},
  ],
};

/// Descriptor for `GetResponseChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResponseChatDescriptor = $convert.base64Decode(
    'Cg9HZXRSZXNwb25zZUNoYXQSJQoFY2hhdHMYASADKAsyDy5jaGF0LkNoYXRVc2Vyc1IFY2hhdH'
    'M=');

@$core.Deprecated('Use chatUsersDescriptor instead')
const ChatUsers$json = {
  '1': 'ChatUsers',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'chat_id', '3': 2, '4': 1, '5': 13, '10': 'chatId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'user', '3': 4, '4': 1, '5': 11, '6': '.chat.User', '10': 'user'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 6, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'chat', '3': 7, '4': 1, '5': 11, '6': '.chat.Chat', '10': 'chat'},
  ],
};

/// Descriptor for `ChatUsers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatUsersDescriptor = $convert.base64Decode(
    'CglDaGF0VXNlcnMSDgoCaWQYASABKA1SAmlkEhcKB2NoYXRfaWQYAiABKA1SBmNoYXRJZBIXCg'
    'd1c2VyX2lkGAMgASgNUgZ1c2VySWQSHgoEdXNlchgEIAEoCzIKLmNoYXQuVXNlclIEdXNlchId'
    'CgpjcmVhdGVkX2F0GAUgASgJUgljcmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgGIAEoCVIJdXBkYX'
    'RlZEF0Eh4KBGNoYXQYByABKAsyCi5jaGF0LkNoYXRSBGNoYXQ=');

@$core.Deprecated('Use chatDescriptor instead')
const Chat$json = {
  '1': 'Chat',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.chat.Message', '10': 'message'},
    {'1': 'name_chat', '3': 3, '4': 1, '5': 9, '10': 'nameChat'},
    {'1': 'chat_users', '3': 4, '4': 3, '5': 11, '6': '.chat.ChatUsers', '10': 'chatUsers'},
  ],
};

/// Descriptor for `Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatDescriptor = $convert.base64Decode(
    'CgRDaGF0Eg4KAmlkGAEgASgNUgJpZBInCgdtZXNzYWdlGAIgASgLMg0uY2hhdC5NZXNzYWdlUg'
    'dtZXNzYWdlEhsKCW5hbWVfY2hhdBgDIAEoCVIIbmFtZUNoYXQSLgoKY2hhdF91c2VycxgEIAMo'
    'CzIPLmNoYXQuQ2hhdFVzZXJzUgljaGF0VXNlcnM=');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'chat_id', '3': 5, '4': 1, '5': 13, '10': 'chatId'},
    {'1': 'text', '3': 6, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgNUgJpZBIdCgpjcmVhdGVkX2F0GAIgASgJUgljcmVhdGVkQX'
    'QSHQoKdXBkYXRlZF9hdBgDIAEoCVIJdXBkYXRlZEF0EhcKB3VzZXJfaWQYBCABKA1SBnVzZXJJ'
    'ZBIXCgdjaGF0X2lkGAUgASgNUgZjaGF0SWQSEgoEdGV4dBgGIAEoCVIEdGV4dA==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgNUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBWVtYWlsGAMgAS'
    'gJUgVlbWFpbA==');

@$core.Deprecated('Use createSecondaryKeyRequestDescriptor instead')
const CreateSecondaryKeyRequest$json = {
  '1': 'CreateSecondaryKeyRequest',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 13, '10': 'chatId'},
    {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `CreateSecondaryKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSecondaryKeyRequestDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVTZWNvbmRhcnlLZXlSZXF1ZXN0EhcKB2NoYXRfaWQYASABKA1SBmNoYXRJZBIQCg'
    'NrZXkYAiABKAlSA2tleQ==');

@$core.Deprecated('Use createSecondaryKeyResponseDescriptor instead')
const CreateSecondaryKeyResponse$json = {
  '1': 'CreateSecondaryKeyResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateSecondaryKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSecondaryKeyResponseDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVTZWNvbmRhcnlLZXlSZXNwb25zZRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use getSecondaryKeyRequestDescriptor instead')
const GetSecondaryKeyRequest$json = {
  '1': 'GetSecondaryKeyRequest',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `GetSecondaryKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSecondaryKeyRequestDescriptor = $convert.base64Decode(
    'ChZHZXRTZWNvbmRhcnlLZXlSZXF1ZXN0EhcKB2NoYXRfaWQYASABKA1SBmNoYXRJZA==');

@$core.Deprecated('Use getSecondaryKeyResponseDescriptor instead')
const GetSecondaryKeyResponse$json = {
  '1': 'GetSecondaryKeyResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'p', '3': 2, '4': 1, '5': 9, '10': 'p'},
  ],
};

/// Descriptor for `GetSecondaryKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSecondaryKeyResponseDescriptor = $convert.base64Decode(
    'ChdHZXRTZWNvbmRhcnlLZXlSZXNwb25zZRIQCgNrZXkYASABKAlSA2tleRIMCgFwGAIgASgJUg'
    'Fw');

@$core.Deprecated('Use getPublicKeyRequestDescriptor instead')
const GetPublicKeyRequest$json = {
  '1': 'GetPublicKeyRequest',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `GetPublicKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPublicKeyRequestDescriptor = $convert.base64Decode(
    'ChNHZXRQdWJsaWNLZXlSZXF1ZXN0EhcKB2NoYXRfaWQYASABKA1SBmNoYXRJZA==');

@$core.Deprecated('Use getPublicKeyResponseDescriptor instead')
const GetPublicKeyResponse$json = {
  '1': 'GetPublicKeyResponse',
  '2': [
    {'1': 'g', '3': 1, '4': 1, '5': 3, '10': 'g'},
    {'1': 'p', '3': 2, '4': 1, '5': 9, '10': 'p'},
  ],
};

/// Descriptor for `GetPublicKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPublicKeyResponseDescriptor = $convert.base64Decode(
    'ChRHZXRQdWJsaWNLZXlSZXNwb25zZRIMCgFnGAEgASgDUgFnEgwKAXAYAiABKAlSAXA=');

