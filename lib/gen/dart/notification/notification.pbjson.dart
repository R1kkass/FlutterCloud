//
//  Generated code. Do not modify.
//  source: notification/notification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use notificationMessageDescriptor instead')
const NotificationMessage$json = {
  '1': 'NotificationMessage',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'options', '3': 4, '4': 3, '5': 11, '6': '.notification.NotificationMessage.OptionsEntry', '10': 'options'},
  ],
  '3': [NotificationMessage_OptionsEntry$json],
};

@$core.Deprecated('Use notificationMessageDescriptor instead')
const NotificationMessage_OptionsEntry$json = {
  '1': 'OptionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `NotificationMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationMessageDescriptor = $convert.base64Decode(
    'ChNOb3RpZmljYXRpb25NZXNzYWdlEhIKBHR5cGUYASABKAlSBHR5cGUSFAoFdGl0bGUYAiABKA'
    'lSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhJICgdvcHRpb25zGAQg'
    'AygLMi4ubm90aWZpY2F0aW9uLk5vdGlmaWNhdGlvbk1lc3NhZ2UuT3B0aW9uc0VudHJ5UgdvcH'
    'Rpb25zGjoKDE9wdGlvbnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIF'
    'dmFsdWU6AjgB');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

