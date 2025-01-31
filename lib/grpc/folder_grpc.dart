import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/grpc/files_grpc.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/proto/files/files.pb.dart';
import 'package:TalkSpace/proto/folder/folder.pbgrpc.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';

class FolderGrpc {
  final _stub = FolderGreeterClient(channel);

  CallOptions get _options => CallOptions(metadata: {
        "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
      });

  ResponseFuture<CreateFolderResponse> createFolder(
      CreateFolderRequest request) {
    request.folderId ??= 0;
    return _stub.createFolder(request, options: _options);
  }

  ResponseFuture<DeleteFolderResponse> deleteFolder(
      DeleteFolderRequest request) {
    return _stub.deleteFolder(request, options: _options);
  }

  ResponseFuture<RenameFolderResponse> renameFolder(
      RenameFolderRequest request) {
    return _stub.renameFolder(request, options: _options);
  }

  ResponseFuture<MoveFolderResponse> grpcMoveFolder(MoveFolderRequest request) {
    return _stub.moveFolder(request, options: _options);
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
