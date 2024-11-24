//
//  Generated code. Do not modify.
//  source: chat/chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use typeMessageDescriptor instead')
const TypeMessage$json = {
  '1': 'TypeMessage',
  '2': [
    {'1': 'SEND_MESSAGE', '2': 0},
    {'1': 'READ_MESSAGE', '2': 1},
  ],
};

/// Descriptor for `TypeMessage`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typeMessageDescriptor = $convert.base64Decode(
    'CgtUeXBlTWVzc2FnZRIQCgxTRU5EX01FU1NBR0UQABIQCgxSRUFEX01FU1NBR0UQAQ==');

@$core.Deprecated('Use streamGetMessagesRequestDescriptor instead')
const StreamGetMessagesRequest$json = {
  '1': 'StreamGetMessagesRequest',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.chat.TypeMessage', '10': 'type'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'message_id', '3': 3, '4': 1, '5': 13, '10': 'messageId'},
  ],
};

/// Descriptor for `StreamGetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGetMessagesRequestDescriptor = $convert.base64Decode(
    'ChhTdHJlYW1HZXRNZXNzYWdlc1JlcXVlc3QSJQoEdHlwZRgBIAEoDjIRLmNoYXQuVHlwZU1lc3'
    'NhZ2VSBHR5cGUSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZRIdCgptZXNzYWdlX2lkGAMgASgN'
    'UgltZXNzYWdlSWQ=');

@$core.Deprecated('Use streamGetMessagesResponseDescriptor instead')
const StreamGetMessagesResponse$json = {
  '1': 'StreamGetMessagesResponse',
  '2': [
    {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.chat.Message', '10': 'message'},
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.chat.TypeMessage', '10': 'type'},
  ],
};

/// Descriptor for `StreamGetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGetMessagesResponseDescriptor = $convert.base64Decode(
    'ChlTdHJlYW1HZXRNZXNzYWdlc1Jlc3BvbnNlEicKB21lc3NhZ2UYAiABKAsyDS5jaGF0Lk1lc3'
    'NhZ2VSB21lc3NhZ2USJQoEdHlwZRgBIAEoDjIRLmNoYXQuVHlwZU1lc3NhZ2VSBHR5cGU=');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use streamGetMessagesGeneralResponseDescriptor instead')
const StreamGetMessagesGeneralResponse$json = {
  '1': 'StreamGetMessagesGeneralResponse',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `StreamGetMessagesGeneralResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGetMessagesGeneralResponseDescriptor = $convert.base64Decode(
    'CiBTdHJlYW1HZXRNZXNzYWdlc0dlbmVyYWxSZXNwb25zZRIUCgVjb3VudBgBIAEoBVIFY291bn'
    'Q=');

@$core.Deprecated('Use acceptChatRequestDescriptor instead')
const AcceptChatRequest$json = {
  '1': 'AcceptChatRequest',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `AcceptChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptChatRequestDescriptor = $convert.base64Decode(
    'ChFBY2NlcHRDaGF0UmVxdWVzdBIXCgdjaGF0X2lkGAEgASgNUgZjaGF0SWQ=');

@$core.Deprecated('Use acceptChatResponseDescriptor instead')
const AcceptChatResponse$json = {
  '1': 'AcceptChatResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AcceptChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptChatResponseDescriptor = $convert.base64Decode(
    'ChJBY2NlcHRDaGF0UmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use dissalowChatRequestDescriptor instead')
const DissalowChatRequest$json = {
  '1': 'DissalowChatRequest',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `DissalowChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dissalowChatRequestDescriptor = $convert.base64Decode(
    'ChNEaXNzYWxvd0NoYXRSZXF1ZXN0EhcKB2NoYXRfaWQYASABKA1SBmNoYXRJZA==');

@$core.Deprecated('Use dissalowChatResponseDescriptor instead')
const DissalowChatResponse$json = {
  '1': 'DissalowChatResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DissalowChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dissalowChatResponseDescriptor = $convert.base64Decode(
    'ChREaXNzYWxvd0NoYXRSZXNwb25zZRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

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

@$core.Deprecated('Use streamGetResponseChatDescriptor instead')
const StreamGetResponseChat$json = {
  '1': 'StreamGetResponseChat',
  '2': [
    {'1': 'chats', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatUsersCount', '10': 'chats'},
  ],
};

/// Descriptor for `StreamGetResponseChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGetResponseChatDescriptor = $convert.base64Decode(
    'ChVTdHJlYW1HZXRSZXNwb25zZUNoYXQSKgoFY2hhdHMYASADKAsyFC5jaGF0LkNoYXRVc2Vyc0'
    'NvdW50UgVjaGF0cw==');

@$core.Deprecated('Use getUnSuccessChatsResponseDescriptor instead')
const GetUnSuccessChatsResponse$json = {
  '1': 'GetUnSuccessChatsResponse',
  '2': [
    {'1': 'chats', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatUsers', '10': 'chats'},
  ],
};

/// Descriptor for `GetUnSuccessChatsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnSuccessChatsResponseDescriptor = $convert.base64Decode(
    'ChlHZXRVblN1Y2Nlc3NDaGF0c1Jlc3BvbnNlEiUKBWNoYXRzGAEgAygLMg8uY2hhdC5DaGF0VX'
    'NlcnNSBWNoYXRz');

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

@$core.Deprecated('Use chatUsersCountDescriptor instead')
const ChatUsersCount$json = {
  '1': 'ChatUsersCount',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'chat_id', '3': 2, '4': 1, '5': 13, '10': 'chatId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'user', '3': 4, '4': 1, '5': 11, '6': '.chat.User', '10': 'user'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 6, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'chat', '3': 7, '4': 1, '5': 11, '6': '.chat.Chat', '10': 'chat'},
    {'1': 'un_readed_messages_count', '3': 8, '4': 1, '5': 5, '10': 'unReadedMessagesCount'},
    {'1': 'text', '3': 9, '4': 1, '5': 9, '10': 'text'},
    {'1': 'message_user_id', '3': 10, '4': 1, '5': 9, '10': 'messageUserId'},
  ],
};

/// Descriptor for `ChatUsersCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatUsersCountDescriptor = $convert.base64Decode(
    'Cg5DaGF0VXNlcnNDb3VudBIOCgJpZBgBIAEoDVICaWQSFwoHY2hhdF9pZBgCIAEoDVIGY2hhdE'
    'lkEhcKB3VzZXJfaWQYAyABKA1SBnVzZXJJZBIeCgR1c2VyGAQgASgLMgouY2hhdC5Vc2VyUgR1'
    'c2VyEh0KCmNyZWF0ZWRfYXQYBSABKAlSCWNyZWF0ZWRBdBIdCgp1cGRhdGVkX2F0GAYgASgJUg'
    'l1cGRhdGVkQXQSHgoEY2hhdBgHIAEoCzIKLmNoYXQuQ2hhdFIEY2hhdBI3Chh1bl9yZWFkZWRf'
    'bWVzc2FnZXNfY291bnQYCCABKAVSFXVuUmVhZGVkTWVzc2FnZXNDb3VudBISCgR0ZXh0GAkgAS'
    'gJUgR0ZXh0EiYKD21lc3NhZ2VfdXNlcl9pZBgKIAEoCVINbWVzc2FnZVVzZXJJZA==');

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
    {'1': 'user', '3': 7, '4': 1, '5': 11, '6': '.chat.User', '10': 'user'},
    {'1': 'status_read', '3': 8, '4': 1, '5': 8, '10': 'statusRead'},
    {'1': 'un_readed_message', '3': 9, '4': 1, '5': 8, '10': 'unReadedMessage'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgNUgJpZBIdCgpjcmVhdGVkX2F0GAIgASgJUgljcmVhdGVkQX'
    'QSHQoKdXBkYXRlZF9hdBgDIAEoCVIJdXBkYXRlZEF0EhcKB3VzZXJfaWQYBCABKA1SBnVzZXJJ'
    'ZBIXCgdjaGF0X2lkGAUgASgNUgZjaGF0SWQSEgoEdGV4dBgGIAEoCVIEdGV4dBIeCgR1c2VyGA'
    'cgASgLMgouY2hhdC5Vc2VyUgR1c2VyEh8KC3N0YXR1c19yZWFkGAggASgIUgpzdGF0dXNSZWFk'
    'EioKEXVuX3JlYWRlZF9tZXNzYWdlGAkgASgIUg91blJlYWRlZE1lc3NhZ2U=');

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

@$core.Deprecated('Use getMessagesRequestDescriptor instead')
const GetMessagesRequest$json = {
  '1': 'GetMessagesRequest',
  '2': [
    {'1': 'chatId', '3': 1, '4': 1, '5': 13, '10': 'chatId'},
    {'1': 'page', '3': 2, '4': 1, '5': 13, '10': 'page'},
    {'1': 'init', '3': 3, '4': 1, '5': 8, '10': 'init'},
  ],
};

/// Descriptor for `GetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesRequestDescriptor = $convert.base64Decode(
    'ChJHZXRNZXNzYWdlc1JlcXVlc3QSFgoGY2hhdElkGAEgASgNUgZjaGF0SWQSEgoEcGFnZRgCIA'
    'EoDVIEcGFnZRISCgRpbml0GAMgASgIUgRpbml0');

@$core.Deprecated('Use getMessagesResponseDescriptor instead')
const GetMessagesResponse$json = {
  '1': 'GetMessagesResponse',
  '2': [
    {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.chat.Message', '10': 'messages'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'count_not_read', '3': 3, '4': 1, '5': 5, '10': 'countNotRead'},
  ],
};

/// Descriptor for `GetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesResponseDescriptor = $convert.base64Decode(
    'ChNHZXRNZXNzYWdlc1Jlc3BvbnNlEikKCG1lc3NhZ2VzGAEgAygLMg0uY2hhdC5NZXNzYWdlUg'
    'htZXNzYWdlcxISCgRwYWdlGAIgASgFUgRwYWdlEiQKDmNvdW50X25vdF9yZWFkGAMgASgFUgxj'
    'b3VudE5vdFJlYWQ=');

@$core.Deprecated('Use uploadFileChatDescriptor instead')
const UploadFileChat$json = {
  '1': 'UploadFileChat',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'fileName', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'chatId', '3': 3, '4': 1, '5': 13, '10': 'chatId'},
    {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `UploadFileChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadFileChatDescriptor = $convert.base64Decode(
    'Cg5VcGxvYWRGaWxlQ2hhdBIUCgVjaHVuaxgBIAEoDFIFY2h1bmsSGgoIZmlsZU5hbWUYAiABKA'
    'lSCGZpbGVOYW1lEhYKBmNoYXRJZBgDIAEoDVIGY2hhdElkEhIKBHRleHQYBCABKAlSBHRleHQ=');

@$core.Deprecated('Use downloadFileChatResponseDescriptor instead')
const DownloadFileChatResponse$json = {
  '1': 'DownloadFileChatResponse',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
  ],
};

/// Descriptor for `DownloadFileChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFileChatResponseDescriptor = $convert.base64Decode(
    'ChhEb3dubG9hZEZpbGVDaGF0UmVzcG9uc2USFAoFY2h1bmsYASABKAxSBWNodW5r');

@$core.Deprecated('Use downloadFileChatRequestDescriptor instead')
const DownloadFileChatRequest$json = {
  '1': 'DownloadFileChatRequest',
  '2': [
    {'1': 'chat_file_id', '3': 1, '4': 1, '5': 13, '10': 'chatFileId'},
  ],
};

/// Descriptor for `DownloadFileChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFileChatRequestDescriptor = $convert.base64Decode(
    'ChdEb3dubG9hZEZpbGVDaGF0UmVxdWVzdBIgCgxjaGF0X2ZpbGVfaWQYASABKA1SCmNoYXRGaW'
    'xlSWQ=');

