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
    {'1': 'UPLOAD_MESSAGE', '2': 2},
    {'1': 'READ_MESSAGE_ALL', '2': 3},
  ],
};

/// Descriptor for `TypeMessage`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typeMessageDescriptor = $convert.base64Decode(
    'CgtUeXBlTWVzc2FnZRIQCgxTRU5EX01FU1NBR0UQABIQCgxSRUFEX01FU1NBR0UQARISCg5VUE'
    'xPQURfTUVTU0FHRRACEhQKEFJFQURfTUVTU0FHRV9BTEwQAw==');

@$core.Deprecated('Use streamGetMessagesRequestDescriptor instead')
const StreamGetMessagesRequest$json = {
  '1': 'StreamGetMessagesRequest',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.chat.TypeMessage', '10': 'type'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'message_id', '3': 3, '4': 1, '5': 13, '10': 'messageId'},
  ],
};

/// Descriptor for `StreamGetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGetMessagesRequestDescriptor = $convert.base64Decode(
    'ChhTdHJlYW1HZXRNZXNzYWdlc1JlcXVlc3QSJQoEdHlwZRgBIAEoDjIRLmNoYXQuVHlwZU1lc3'
    'NhZ2VSBHR5cGUSEgoEdGV4dBgCIAEoCVIEdGV4dBIdCgptZXNzYWdlX2lkGAMgASgNUgltZXNz'
    'YWdlSWQ=');

@$core.Deprecated('Use streamGetMessagesResponseDescriptor instead')
const StreamGetMessagesResponse$json = {
  '1': 'StreamGetMessagesResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.chat.Message', '10': 'message'},
    {'1': 'messages', '3': 2, '4': 3, '5': 11, '6': '.chat.Message', '10': 'messages'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.chat.TypeMessage', '10': 'type'},
  ],
};

/// Descriptor for `StreamGetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGetMessagesResponseDescriptor = $convert.base64Decode(
    'ChlTdHJlYW1HZXRNZXNzYWdlc1Jlc3BvbnNlEicKB21lc3NhZ2UYASABKAsyDS5jaGF0Lk1lc3'
    'NhZ2VSB21lc3NhZ2USKQoIbWVzc2FnZXMYAiADKAsyDS5jaGF0Lk1lc3NhZ2VSCG1lc3NhZ2Vz'
    'EiUKBHR5cGUYAyABKA4yES5jaGF0LlR5cGVNZXNzYWdlUgR0eXBl');

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
};

/// Descriptor for `AcceptChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptChatResponseDescriptor = $convert.base64Decode(
    'ChJBY2NlcHRDaGF0UmVzcG9uc2U=');

@$core.Deprecated('Use disallowChatRequestDescriptor instead')
const DisallowChatRequest$json = {
  '1': 'DisallowChatRequest',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `DisallowChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disallowChatRequestDescriptor = $convert.base64Decode(
    'ChNEaXNhbGxvd0NoYXRSZXF1ZXN0EhcKB2NoYXRfaWQYASABKA1SBmNoYXRJZA==');

@$core.Deprecated('Use disallowChatResponseDescriptor instead')
const DisallowChatResponse$json = {
  '1': 'DisallowChatResponse',
};

/// Descriptor for `DisallowChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disallowChatResponseDescriptor = $convert.base64Decode(
    'ChREaXNhbGxvd0NoYXRSZXNwb25zZQ==');

@$core.Deprecated('Use createRequestChatDescriptor instead')
const CreateRequestChat$json = {
  '1': 'CreateRequestChat',
  '2': [
    {'1': 'companionUuid', '3': 1, '4': 1, '5': 9, '10': 'companionUuid'},
  ],
};

/// Descriptor for `CreateRequestChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRequestChatDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVSZXF1ZXN0Q2hhdBIkCg1jb21wYW5pb25VdWlkGAEgASgJUg1jb21wYW5pb25VdW'
    'lk');

@$core.Deprecated('Use createResponseChatDescriptor instead')
const CreateResponseChat$json = {
  '1': 'CreateResponseChat',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    {'1': 'keys', '3': 2, '4': 1, '5': 11, '6': '.chat.Keys', '10': 'keys'},
    {'1': 'chat_id', '3': 3, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `CreateResponseChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createResponseChatDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVSZXNwb25zZUNoYXQSEgoEdGV4dBgBIAEoCVIEdGV4dBIeCgRrZXlzGAIgASgLMg'
    'ouY2hhdC5LZXlzUgRrZXlzEhcKB2NoYXRfaWQYAyABKA1SBmNoYXRJZA==');

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
    {'1': 'chats', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatWithUnReadingMessagesCount', '10': 'chats'},
  ],
};

/// Descriptor for `StreamGetResponseChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGetResponseChatDescriptor = $convert.base64Decode(
    'ChVTdHJlYW1HZXRSZXNwb25zZUNoYXQSOgoFY2hhdHMYASADKAsyJC5jaGF0LkNoYXRXaXRoVW'
    '5SZWFkaW5nTWVzc2FnZXNDb3VudFIFY2hhdHM=');

@$core.Deprecated('Use getUnSuccessChatsResponseDescriptor instead')
const GetUnSuccessChatsResponse$json = {
  '1': 'GetUnSuccessChatsResponse',
  '2': [
    {'1': 'chats', '3': 1, '4': 3, '5': 11, '6': '.chat.Chat', '10': 'chats'},
  ],
};

/// Descriptor for `GetUnSuccessChatsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnSuccessChatsResponseDescriptor = $convert.base64Decode(
    'ChlHZXRVblN1Y2Nlc3NDaGF0c1Jlc3BvbnNlEiAKBWNoYXRzGAEgAygLMgouY2hhdC5DaGF0Ug'
    'VjaGF0cw==');

@$core.Deprecated('Use chatWithUnReadingMessagesCountDescriptor instead')
const ChatWithUnReadingMessagesCount$json = {
  '1': 'ChatWithUnReadingMessagesCount',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.chat.Message', '10': 'message'},
    {'1': 'name_chat', '3': 3, '4': 1, '5': 9, '10': 'nameChat'},
    {'1': 'users', '3': 4, '4': 3, '5': 11, '6': '.user.User', '10': 'users'},
    {'1': 'un_reading_messages_count', '3': 5, '4': 1, '5': 5, '10': 'unReadingMessagesCount'},
  ],
};

/// Descriptor for `ChatWithUnReadingMessagesCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatWithUnReadingMessagesCountDescriptor = $convert.base64Decode(
    'Ch5DaGF0V2l0aFVuUmVhZGluZ01lc3NhZ2VzQ291bnQSDgoCaWQYASABKA1SAmlkEicKB21lc3'
    'NhZ2UYAiABKAsyDS5jaGF0Lk1lc3NhZ2VSB21lc3NhZ2USGwoJbmFtZV9jaGF0GAMgASgJUghu'
    'YW1lQ2hhdBIgCgV1c2VycxgEIAMoCzIKLnVzZXIuVXNlclIFdXNlcnMSOQoZdW5fcmVhZGluZ1'
    '9tZXNzYWdlc19jb3VudBgFIAEoBVIWdW5SZWFkaW5nTWVzc2FnZXNDb3VudA==');

@$core.Deprecated('Use chatDescriptor instead')
const Chat$json = {
  '1': 'Chat',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'messages', '3': 2, '4': 3, '5': 11, '6': '.chat.Message', '10': 'messages'},
    {'1': 'name_chat', '3': 3, '4': 1, '5': 9, '10': 'nameChat'},
    {'1': 'users', '3': 4, '4': 3, '5': 11, '6': '.user.User', '10': 'users'},
  ],
};

/// Descriptor for `Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatDescriptor = $convert.base64Decode(
    'CgRDaGF0Eg4KAmlkGAEgASgNUgJpZBIpCghtZXNzYWdlcxgCIAMoCzINLmNoYXQuTWVzc2FnZV'
    'IIbWVzc2FnZXMSGwoJbmFtZV9jaGF0GAMgASgJUghuYW1lQ2hhdBIgCgV1c2VycxgEIAMoCzIK'
    'LnVzZXIuVXNlclIFdXNlcnM=');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'chat_id', '3': 5, '4': 1, '5': 13, '10': 'chatId'},
    {'1': 'text', '3': 6, '4': 1, '5': 9, '10': 'text'},
    {'1': 'user', '3': 7, '4': 1, '5': 11, '6': '.user.User', '10': 'user'},
    {'1': 'status_read', '3': 8, '4': 1, '5': 8, '10': 'statusRead'},
    {'1': 'message_files', '3': 9, '4': 3, '5': 11, '6': '.chat.MessageFile', '10': 'messageFiles'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgNUgJpZBI5CgpjcmVhdGVkX2F0GAIgASgLMhouZ29vZ2xlLn'
    'Byb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYAyABKAsyGi5nb29n'
    'bGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSFwoHdXNlcl9pZBgEIAEoDVIGdXNlck'
    'lkEhcKB2NoYXRfaWQYBSABKA1SBmNoYXRJZBISCgR0ZXh0GAYgASgJUgR0ZXh0Eh4KBHVzZXIY'
    'ByABKAsyCi51c2VyLlVzZXJSBHVzZXISHwoLc3RhdHVzX3JlYWQYCCABKAhSCnN0YXR1c1JlYW'
    'QSNgoNbWVzc2FnZV9maWxlcxgJIAMoCzIRLmNoYXQuTWVzc2FnZUZpbGVSDG1lc3NhZ2VGaWxl'
    'cw==');

@$core.Deprecated('Use messageFileDescriptor instead')
const MessageFile$json = {
  '1': 'MessageFile',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'size', '3': 2, '4': 1, '5': 3, '10': 'size'},
    {'1': 'file_name', '3': 3, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'message_id', '3': 4, '4': 1, '5': 13, '10': 'messageId'},
  ],
};

/// Descriptor for `MessageFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageFileDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlRmlsZRIOCgJpZBgBIAEoDVICaWQSEgoEc2l6ZRgCIAEoA1IEc2l6ZRIbCglmaW'
    'xlX25hbWUYAyABKAlSCGZpbGVOYW1lEh0KCm1lc3NhZ2VfaWQYBCABKA1SCW1lc3NhZ2VJZA==');

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

