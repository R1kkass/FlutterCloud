//
//  Generated code. Do not modify.
//  source: message/message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use uploadFileMessageRequestDescriptor instead')
const UploadFileMessageRequest$json = {
  '1': 'UploadFileMessageRequest',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'fileName', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'messageId', '3': 3, '4': 1, '5': 13, '10': 'messageId'},
    {'1': 'chatId', '3': 4, '4': 1, '5': 13, '10': 'chatId'},
    {'1': 'text', '3': 5, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `UploadFileMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadFileMessageRequestDescriptor = $convert.base64Decode(
    'ChhVcGxvYWRGaWxlTWVzc2FnZVJlcXVlc3QSFAoFY2h1bmsYASABKAxSBWNodW5rEhoKCGZpbG'
    'VOYW1lGAIgASgJUghmaWxlTmFtZRIcCgltZXNzYWdlSWQYAyABKA1SCW1lc3NhZ2VJZBIWCgZj'
    'aGF0SWQYBCABKA1SBmNoYXRJZBISCgR0ZXh0GAUgASgJUgR0ZXh0');

@$core.Deprecated('Use uploadFileMessageResponseDescriptor instead')
const UploadFileMessageResponse$json = {
  '1': 'UploadFileMessageResponse',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `UploadFileMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadFileMessageResponseDescriptor = $convert.base64Decode(
    'ChlVcGxvYWRGaWxlTWVzc2FnZVJlc3BvbnNlEhIKBHRleHQYASABKAlSBHRleHQ=');

@$core.Deprecated('Use downloadFileMessageRequestDescriptor instead')
const DownloadFileMessageRequest$json = {
  '1': 'DownloadFileMessageRequest',
  '2': [
    {'1': 'message_file_id', '3': 1, '4': 1, '5': 13, '10': 'messageFileId'},
    {'1': 'message_id', '3': 2, '4': 1, '5': 13, '10': 'messageId'},
    {'1': 'chat_id', '3': 3, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `DownloadFileMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFileMessageRequestDescriptor = $convert.base64Decode(
    'ChpEb3dubG9hZEZpbGVNZXNzYWdlUmVxdWVzdBImCg9tZXNzYWdlX2ZpbGVfaWQYASABKA1SDW'
    '1lc3NhZ2VGaWxlSWQSHQoKbWVzc2FnZV9pZBgCIAEoDVIJbWVzc2FnZUlkEhcKB2NoYXRfaWQY'
    'AyABKA1SBmNoYXRJZA==');

@$core.Deprecated('Use downloadFileMessageResponseDescriptor instead')
const DownloadFileMessageResponse$json = {
  '1': 'DownloadFileMessageResponse',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'progress', '3': 2, '4': 1, '5': 2, '10': 'progress'},
  ],
};

/// Descriptor for `DownloadFileMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFileMessageResponseDescriptor = $convert.base64Decode(
    'ChtEb3dubG9hZEZpbGVNZXNzYWdlUmVzcG9uc2USFAoFY2h1bmsYASABKAxSBWNodW5rEhoKCH'
    'Byb2dyZXNzGAIgASgCUghwcm9ncmVzcw==');

@$core.Deprecated('Use createFileMessageRequestDescriptor instead')
const CreateFileMessageRequest$json = {
  '1': 'CreateFileMessageRequest',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    {'1': 'chat_id', '3': 2, '4': 1, '5': 13, '10': 'chatId'},
  ],
};

/// Descriptor for `CreateFileMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFileMessageRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVGaWxlTWVzc2FnZVJlcXVlc3QSEgoEdGV4dBgBIAEoCVIEdGV4dBIXCgdjaGF0X2'
    'lkGAIgASgNUgZjaGF0SWQ=');

@$core.Deprecated('Use createFileMessageResponseDescriptor instead')
const CreateFileMessageResponse$json = {
  '1': 'CreateFileMessageResponse',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 13, '10': 'messageId'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `CreateFileMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFileMessageResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVGaWxlTWVzc2FnZVJlc3BvbnNlEh0KCm1lc3NhZ2VfaWQYASABKA1SCW1lc3NhZ2'
    'VJZBI5CgpjcmVhdGVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3Jl'
    'YXRlZEF0EjkKCnVwZGF0ZWRfYXQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg'
    'l1cGRhdGVkQXQ=');

