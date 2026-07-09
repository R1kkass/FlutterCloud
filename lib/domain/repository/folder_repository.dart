abstract class FolderRepository {
  Future<void> createFolder({
    required final String name,
    required final int? folderId,
  });

  Future<void> deleteFolder(int folderId);

  Future<void> renameFolder({
    required final String name,
    required final int folderId,
});

  Future<void> moveFolder({
    required int folderId,
    required int? folderToId,
  });
}
