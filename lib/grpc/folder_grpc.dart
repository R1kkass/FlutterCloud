import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/grpc/base_grpc.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/grpc/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:TalkSpace/gen/dart/folder/folder.pbgrpc.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';

class FolderGrpc extends BaseGrpc {
  late final _stub = FolderGreeterClient(channel, interceptors: [AuthInterceptor()]);

  ResponseFuture<CreateFolderResponse> createFolder(
      CreateFolderRequest request) {
    request.folderId ??= 0;
    return _stub.createFolder(request, options: options);
  }

  ResponseFuture<DeleteFolderResponse> deleteFolder(
      DeleteFolderRequest request) {
    return _stub.deleteFolder(request, options: options);
  }

  ResponseFuture<RenameFolderResponse> renameFolder(
      RenameFolderRequest request) {
    return _stub.renameFolder(request, options: options);
  }

  ResponseFuture<MoveFolderResponse> grpcMoveFolder(MoveFolderRequest request) {
    return _stub.moveFolder(request, options: options);
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
