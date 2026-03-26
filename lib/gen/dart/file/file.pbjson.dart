//
//  Generated code. Do not modify.
//  source: file/file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deleteFileRequestDescriptor instead')
const DeleteFileRequest$json = {
  '1': 'DeleteFileRequest',
  '2': [
    {'1': 'fileId', '3': 1, '4': 1, '5': 13, '10': 'fileId'},
  ],
};

/// Descriptor for `DeleteFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFileRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVGaWxlUmVxdWVzdBIWCgZmaWxlSWQYASABKA1SBmZpbGVJZA==');

@$core.Deprecated('Use deleteFileResponseDescriptor instead')
const DeleteFileResponse$json = {
  '1': 'DeleteFileResponse',
};

/// Descriptor for `DeleteFileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFileResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVGaWxlUmVzcG9uc2U=');

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
    {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.file.File', '10': 'files'},
    {'1': 'folders', '3': 2, '4': 3, '5': 11, '6': '.file.Folder', '10': 'folders'},
  ],
};

/// Descriptor for `FindFileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findFileResponseDescriptor = $convert.base64Decode(
    'ChBGaW5kRmlsZVJlc3BvbnNlEiAKBWZpbGVzGAEgAygLMgouZmlsZS5GaWxlUgVmaWxlcxImCg'
    'dmb2xkZXJzGAIgAygLMgwuZmlsZS5Gb2xkZXJSB2ZvbGRlcnM=');

@$core.Deprecated('Use folderDescriptor instead')
const Folder$json = {
  '1': 'Folder',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'folder_id', '3': 5, '4': 1, '5': 13, '10': 'folderId'},
    {'1': 'name_folder', '3': 6, '4': 1, '5': 9, '10': 'nameFolder'},
    {'1': 'files', '3': 7, '4': 3, '5': 11, '6': '.file.File', '10': 'files'},
    {'1': 'folder', '3': 8, '4': 1, '5': 11, '6': '.file.Folder', '10': 'folder'},
    {'1': 'user', '3': 9, '4': 1, '5': 11, '6': '.user.User', '10': 'user'},
  ],
};

/// Descriptor for `Folder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folderDescriptor = $convert.base64Decode(
    'CgZGb2xkZXISDgoCaWQYASABKA1SAmlkEjkKCmNyZWF0ZWRfYXQYAiABKAsyGi5nb29nbGUucH'
    'JvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgDIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIXCgd1c2VyX2lkGAQgASgNUgZ1c2VySW'
    'QSGwoJZm9sZGVyX2lkGAUgASgNUghmb2xkZXJJZBIfCgtuYW1lX2ZvbGRlchgGIAEoCVIKbmFt'
    'ZUZvbGRlchIgCgVmaWxlcxgHIAMoCzIKLmZpbGUuRmlsZVIFZmlsZXMSJAoGZm9sZGVyGAggAS'
    'gLMgwuZmlsZS5Gb2xkZXJSBmZvbGRlchIeCgR1c2VyGAkgASgLMgoudXNlci5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use fileDescriptor instead')
const File$json = {
  '1': 'File',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'folder_id', '3': 5, '4': 1, '5': 13, '10': 'folderId'},
    {'1': 'media', '3': 6, '4': 1, '5': 11, '6': '.file.Media', '10': 'media'},
    {'1': 'folder', '3': 7, '4': 1, '5': 11, '6': '.file.Folder', '10': 'folder'},
    {'1': 'user', '3': 8, '4': 1, '5': 11, '6': '.user.User', '10': 'user'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode(
    'CgRGaWxlEg4KAmlkGAEgASgNUgJpZBI5CgpjcmVhdGVkX2F0GAIgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYAyABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSFwoHdXNlcl9pZBgEIAEoDVIGdXNlcklkEh'
    'sKCWZvbGRlcl9pZBgFIAEoDVIIZm9sZGVySWQSIQoFbWVkaWEYBiABKAsyCy5maWxlLk1lZGlh'
    'UgVtZWRpYRIkCgZmb2xkZXIYByABKAsyDC5maWxlLkZvbGRlclIGZm9sZGVyEh4KBHVzZXIYCC'
    'ABKAsyCi51c2VyLlVzZXJSBHVzZXI=');

@$core.Deprecated('Use mediaDescriptor instead')
const Media$json = {
  '1': 'Media',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'collection_name', '3': 3, '4': 1, '5': 9, '10': 'collectionName'},
    {'1': 'mime_type', '3': 4, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'size', '3': 5, '4': 1, '5': 4, '10': 'size'},
    {'1': 'file_name', '3': 6, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'extension', '3': 7, '4': 1, '5': 9, '10': 'extension'},
    {'1': 'custom_properties', '3': 8, '4': 1, '5': 9, '10': 'customProperties'},
    {'1': 'model_type', '3': 9, '4': 1, '5': 9, '10': 'modelType'},
    {'1': 'model_id', '3': 10, '4': 1, '5': 13, '10': 'modelId'},
  ],
};

/// Descriptor for `Media`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaDescriptor = $convert.base64Decode(
    'CgVNZWRpYRISCgR1dWlkGAEgASgJUgR1dWlkEhIKBG5hbWUYAiABKAlSBG5hbWUSJwoPY29sbG'
    'VjdGlvbl9uYW1lGAMgASgJUg5jb2xsZWN0aW9uTmFtZRIbCgltaW1lX3R5cGUYBCABKAlSCG1p'
    'bWVUeXBlEhIKBHNpemUYBSABKARSBHNpemUSGwoJZmlsZV9uYW1lGAYgASgJUghmaWxlTmFtZR'
    'IcCglleHRlbnNpb24YByABKAlSCWV4dGVuc2lvbhIrChFjdXN0b21fcHJvcGVydGllcxgIIAEo'
    'CVIQY3VzdG9tUHJvcGVydGllcxIdCgptb2RlbF90eXBlGAkgASgJUgltb2RlbFR5cGUSGQoIbW'
    '9kZWxfaWQYCiABKA1SB21vZGVsSWQ=');

@$core.Deprecated('Use renameFileRequestDescriptor instead')
const RenameFileRequest$json = {
  '1': 'RenameFileRequest',
  '2': [
    {'1': 'folderId', '3': 1, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'fileId', '3': 2, '4': 1, '5': 5, '10': 'fileId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `RenameFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renameFileRequestDescriptor = $convert.base64Decode(
    'ChFSZW5hbWVGaWxlUmVxdWVzdBIaCghmb2xkZXJJZBgBIAEoBVIIZm9sZGVySWQSFgoGZmlsZU'
    'lkGAIgASgFUgZmaWxlSWQSEgoEbmFtZRgDIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use renameFileResponseDescriptor instead')
const RenameFileResponse$json = {
  '1': 'RenameFileResponse',
};

/// Descriptor for `RenameFileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renameFileResponseDescriptor = $convert.base64Decode(
    'ChJSZW5hbWVGaWxlUmVzcG9uc2U=');

@$core.Deprecated('Use moveFileRequestDescriptor instead')
const MoveFileRequest$json = {
  '1': 'MoveFileRequest',
  '2': [
    {'1': 'fileId', '3': 1, '4': 1, '5': 5, '10': 'fileId'},
    {'1': 'folderToId', '3': 2, '4': 1, '5': 5, '10': 'folderToId'},
  ],
};

/// Descriptor for `MoveFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveFileRequestDescriptor = $convert.base64Decode(
    'Cg9Nb3ZlRmlsZVJlcXVlc3QSFgoGZmlsZUlkGAEgASgFUgZmaWxlSWQSHgoKZm9sZGVyVG9JZB'
    'gCIAEoBVIKZm9sZGVyVG9JZA==');

@$core.Deprecated('Use moveFileResponseDescriptor instead')
const MoveFileResponse$json = {
  '1': 'MoveFileResponse',
};

/// Descriptor for `MoveFileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveFileResponseDescriptor = $convert.base64Decode(
    'ChBNb3ZlRmlsZVJlc3BvbnNl');

@$core.Deprecated('Use getSpaceRequestDescriptor instead')
const GetSpaceRequest$json = {
  '1': 'GetSpaceRequest',
};

/// Descriptor for `GetSpaceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSpaceRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRTcGFjZVJlcXVlc3Q=');

@$core.Deprecated('Use getSpaceResponseDescriptor instead')
const GetSpaceResponse$json = {
  '1': 'GetSpaceResponse',
  '2': [
    {'1': 'space', '3': 1, '4': 1, '5': 5, '10': 'space'},
  ],
};

/// Descriptor for `GetSpaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSpaceResponseDescriptor = $convert.base64Decode(
    'ChBHZXRTcGFjZVJlc3BvbnNlEhQKBXNwYWNlGAEgASgFUgVzcGFjZQ==');

