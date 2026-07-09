class RenameFileRequest {
  int folderId;
  int fileId;
  String name;

  RenameFileRequest({
    required this.folderId,
    required this.fileId,
    required this.name,
  });
}