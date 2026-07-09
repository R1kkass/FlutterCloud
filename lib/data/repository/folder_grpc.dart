import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/domain/repository/folder_repository.dart';
import 'package:TalkSpace/gen/dart/folder/folder.pbgrpc.dart';

class FolderGrpc extends BaseGrpc implements FolderRepository {
  late final _stub = FolderGreeterClient(channel, interceptors: [AuthInterceptor()]);

  @override
  Future<void> createFolder({
    required final String name,
    required final int? folderId,
  }) {
    return retry(() => _stub.createFolder(CreateFolderRequest(
      folderId: folderId ?? 0,
      name: name
    )));
  }

  @override
  Future<DeleteFolderResponse> deleteFolder(
      int folderId) {
    return retry(() => _stub.deleteFolder(DeleteFolderRequest(
      folderId: folderId,
    )));
  }

  @override
  Future<void> renameFolder({
    required final String name,
    required final int folderId,
  }) {
    return retry(() => _stub.renameFolder(RenameFolderRequest(
      name: name,
      folderId: folderId,
    )));
  }

  @override
  Future<void> moveFolder({
    required folderId,
    required folderToId,
  }) {
    return retry(() => _stub.moveFolder(MoveFolderRequest(
      folderId: folderId,
      folderToId: folderToId
    )));
  }
}
