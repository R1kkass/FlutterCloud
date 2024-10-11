//
//  Generated code. Do not modify.
//  source: files/files.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fileUploadRequestDescriptor instead')
const FileUploadRequest$json = {
  '1': 'FileUploadRequest',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'fileName', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'folderId', '3': 3, '4': 1, '5': 13, '10': 'folderId'},
  ],
};

/// Descriptor for `FileUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileUploadRequestDescriptor = $convert.base64Decode(
    'ChFGaWxlVXBsb2FkUmVxdWVzdBIUCgVjaHVuaxgBIAEoDFIFY2h1bmsSGgoIZmlsZU5hbWUYAi'
    'ABKAlSCGZpbGVOYW1lEhoKCGZvbGRlcklkGAMgASgNUghmb2xkZXJJZA==');

@$core.Deprecated('Use fileUploadResponseDescriptor instead')
const FileUploadResponse$json = {
  '1': 'FileUploadResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `FileUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileUploadResponseDescriptor = $convert.base64Decode(
    'ChJGaWxlVXBsb2FkUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use fileDownloadRequestDescriptor instead')
const FileDownloadRequest$json = {
  '1': 'FileDownloadRequest',
  '2': [
    {'1': 'fileId', '3': 1, '4': 1, '5': 13, '10': 'fileId'},
    {'1': 'folderId', '3': 2, '4': 1, '5': 13, '10': 'folderId'},
  ],
};

/// Descriptor for `FileDownloadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDownloadRequestDescriptor = $convert.base64Decode(
    'ChNGaWxlRG93bmxvYWRSZXF1ZXN0EhYKBmZpbGVJZBgBIAEoDVIGZmlsZUlkEhoKCGZvbGRlck'
    'lkGAIgASgNUghmb2xkZXJJZA==');

@$core.Deprecated('Use fileDownloadResponseDescriptor instead')
const FileDownloadResponse$json = {
  '1': 'FileDownloadResponse',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'fileName', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'progress', '3': 3, '4': 1, '5': 2, '10': 'progress'},
  ],
};

/// Descriptor for `FileDownloadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDownloadResponseDescriptor = $convert.base64Decode(
    'ChRGaWxlRG93bmxvYWRSZXNwb25zZRIUCgVjaHVuaxgBIAEoDFIFY2h1bmsSGgoIZmlsZU5hbW'
    'UYAiABKAlSCGZpbGVOYW1lEhoKCHByb2dyZXNzGAMgASgCUghwcm9ncmVzcw==');

@$core.Deprecated('Use findFileRequestDescriptor instead')
const FindFileRequest$json = {
  '1': 'FindFileRequest',
  '2': [
    {'1': 'search', '3': 1, '4': 1, '5': 9, '10': 'search'},
    {'1': 'folderId', '3': 2, '4': 1, '5': 13, '10': 'folderId'},
    {'1': 'findEveryWhere', '3': 3, '4': 1, '5': 8, '10': 'findEveryWhere'},
    {'1': 'page', '3': 4, '4': 1, '5': 13, '10': 'page'},
  ],
};

/// Descriptor for `FindFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findFileRequestDescriptor = $convert.base64Decode(
    'Cg9GaW5kRmlsZVJlcXVlc3QSFgoGc2VhcmNoGAEgASgJUgZzZWFyY2gSGgoIZm9sZGVySWQYAi'
    'ABKA1SCGZvbGRlcklkEiYKDmZpbmRFdmVyeVdoZXJlGAMgASgIUg5maW5kRXZlcnlXaGVyZRIS'
    'CgRwYWdlGAQgASgNUgRwYWdl');

@$core.Deprecated('Use findFileResponseDescriptor instead')
const FindFileResponse$json = {
  '1': 'FindFileResponse',
  '2': [
    {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.files.FileFind', '10': 'files'},
    {'1': 'folders', '3': 2, '4': 3, '5': 11, '6': '.files.FolderFind', '10': 'folders'},
  ],
};

/// Descriptor for `FindFileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findFileResponseDescriptor = $convert.base64Decode(
    'ChBGaW5kRmlsZVJlc3BvbnNlEiUKBWZpbGVzGAEgAygLMg8uZmlsZXMuRmlsZUZpbmRSBWZpbG'
    'VzEisKB2ZvbGRlcnMYAiADKAsyES5maWxlcy5Gb2xkZXJGaW5kUgdmb2xkZXJz');

@$core.Deprecated('Use fileFindDescriptor instead')
const FileFind$json = {
  '1': 'FileFind',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'folder_id', '3': 5, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'size', '3': 6, '4': 1, '5': 3, '10': 'size'},
    {'1': 'file_name', '3': 7, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'file_name_hash', '3': 8, '4': 1, '5': 9, '10': 'fileNameHash'},
    {'1': 'access_id', '3': 9, '4': 1, '5': 5, '10': 'accessId'},
  ],
};

/// Descriptor for `FileFind`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileFindDescriptor = $convert.base64Decode(
    'CghGaWxlRmluZBIOCgJpZBgBIAEoBVICaWQSHQoKY3JlYXRlZF9hdBgCIAEoCVIJY3JlYXRlZE'
    'F0Eh0KCnVwZGF0ZWRfYXQYAyABKAlSCXVwZGF0ZWRBdBIXCgd1c2VyX2lkGAQgASgFUgZ1c2Vy'
    'SWQSGwoJZm9sZGVyX2lkGAUgASgFUghmb2xkZXJJZBISCgRzaXplGAYgASgDUgRzaXplEhsKCW'
    'ZpbGVfbmFtZRgHIAEoCVIIZmlsZU5hbWUSJAoOZmlsZV9uYW1lX2hhc2gYCCABKAlSDGZpbGVO'
    'YW1lSGFzaBIbCglhY2Nlc3NfaWQYCSABKAVSCGFjY2Vzc0lk');

@$core.Deprecated('Use folderFindDescriptor instead')
const FolderFind$json = {
  '1': 'FolderFind',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'folder_id', '3': 5, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'access_id', '3': 6, '4': 1, '5': 5, '10': 'accessId'},
    {'1': 'name_folder', '3': 7, '4': 1, '5': 9, '10': 'nameFolder'},
  ],
};

/// Descriptor for `FolderFind`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folderFindDescriptor = $convert.base64Decode(
    'CgpGb2xkZXJGaW5kEg4KAmlkGAEgASgFUgJpZBIdCgpjcmVhdGVkX2F0GAIgASgJUgljcmVhdG'
    'VkQXQSHQoKdXBkYXRlZF9hdBgDIAEoCVIJdXBkYXRlZEF0EhcKB3VzZXJfaWQYBCABKAVSBnVz'
    'ZXJJZBIbCglmb2xkZXJfaWQYBSABKAVSCGZvbGRlcklkEhsKCWFjY2Vzc19pZBgGIAEoBVIIYW'
    'NjZXNzSWQSHwoLbmFtZV9mb2xkZXIYByABKAlSCm5hbWVGb2xkZXI=');

