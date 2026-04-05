import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/data/repository/files_grpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:TalkSpace/gen/dart/folder/folder.pbgrpc.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FolderGrpc extends BaseGrpc {
  late final _stub = FolderGreeterClient(channel, interceptors: [AuthInterceptor()]);

  Future<CreateFolderResponse> createFolder(
      CreateFolderRequest request) {
    request.folderId ??= 0;
    return retry(() => _stub.createFolder(request));
  }

  Future<DeleteFolderResponse> deleteFolder(
      DeleteFolderRequest request) {
    return retry(() => _stub.deleteFolder(request));
  }

  Future<RenameFolderResponse> renameFolder(
      RenameFolderRequest request) {
    return retry(() => _stub.renameFolder(request));
  }

  Future<MoveFolderResponse> grpcMoveFolder(MoveFolderRequest request) {
    return retry(() => _stub.moveFolder(request));
  }

  moveFolder(int folderId, int folderToId, int currentFolderId) async {
    try {
      await _moveFolder(folderId, folderToId, currentFolderId);
    } catch (e) {
      showUnsuccessToast("Не удалось переместить папку");
    }
  }

  _moveFolder(int folderId, int folderToId, int currentFolderId) async {
    final context = NavigationService.navigatorKey.currentContext!;
    await grpcMoveFolder(
        MoveFolderRequest(folderId: folderId, folderToId: folderToId));
    var response = await FilesGrpc().findFile(FindFileRequest(
        search: "", folderId: currentFolderId, findEveryWhere: false));
    context
        .read<ContentBloc>()
        .add(ContentInit(files: response.files, folders: response.folders));
    showSuccessToast("Папка перемещена");
  }
}
