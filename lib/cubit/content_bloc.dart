import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/grpc/files_grpc.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEvent {
  const BlocEvent();
}

class ContentState {
  List<FolderFind?> folders;
  List<FileFind?> files;
  bool error;
  String search;
  Map<int, Map<int, FileUpload?>> uploadFile;

  ContentState(
      {required this.files,
      required this.folders,
      required this.error,
      required this.search,
      required this.uploadFile});
}

class ContentBloc extends Bloc<BlocEvent, ContentState> {
  ContentBloc({required ContentState state})
      : super(ContentState(
            files: [], folders: [], error: false, uploadFile: {}, search: "")) {
    on<ContentInit>(_initContent);
    on<ContentPush>(_pushContent);
    on<UploadFileSet>(_setUploadFile);
    on<UploadFileRemove>(_removeUploadFile);
    on<UploadSetCallback>(_setCallbackUploadFile);
    on<SetSearch>(_setSearch);
    on<SetError>(_setError);
  }

  void _initContent(ContentInit event, Emitter<ContentState> emit) {
    state.files = event.files;
    state.folders = event.folders;
    state.error = false;
    emit(_returnNewState(state));
  }

  void _pushContent(ContentPush event, Emitter<ContentState> emit) {
    state.files = [...state.files, ...event.files];
    state.folders = [...state.folders, ...event.folders];
    state.error = false;
    emit(_returnNewState(state));
  }

  static void defaultRequestFile(int? id, BuildContext context) async {
    var state = context.read<ContentBloc>().state;
    await FilesGrpc()
        .findFile(FindFileRequest(
            search: state.search, folderId: id, findEveryWhere: false, page: 1))
        .then((response) {
      context
          .read<ContentBloc>()
          .add(ContentInit(files: response.files, folders: response.folders));
    }).catchError((e) {
      context.read<ContentBloc>().add(SetError(error: true));
    });
  }

  static void paginationRequestFile(
      int? id, int page, BuildContext context) async {
    var state = context.read<ContentBloc>().state;

    await FilesGrpc()
        .findFile(FindFileRequest(
            search: state.search,
            folderId: id,
            findEveryWhere: false,
            page: page))
        .then((response) {
      context
          .read<ContentBloc>()
          .add(ContentPush(files: response.files, folders: response.folders));
    }).catchError((e) {
      context.read<ContentBloc>().add(SetError(error: true));
    });
  }

  void _setUploadFile(UploadFileSet event, Emitter<ContentState> emit) {
    var id = event.id ?? 0;
    if (state.uploadFile[id] == null) {
      state.uploadFile[id] = {};
    }
    state.uploadFile[id]?[event.data.id] = event.data;
    emit(_returnNewState(state));
  }

  void _removeUploadFile(UploadFileRemove event, Emitter<ContentState> emit) {
    var folderId = event.folderId ?? 0;
    state.uploadFile[folderId]?.remove(event.id);
    emit(_returnNewState(state));
  }

  void _setCallbackUploadFile(
      UploadSetCallback event, Emitter<ContentState> emit) {
    var folderId = event.folderId ?? 0;
    state.uploadFile[folderId]?[event.id]?.callback = event.callback;
    emit(_returnNewState(state));
  }

  void _setSearch(SetSearch event, Emitter<ContentState> emit) {
    state.search = event.search;
    emit(_returnNewState(state));
  }

  void _setError(SetError event, Emitter<ContentState> emit) {
    state.error = event.error;
    emit(_returnNewState(state));
  }

  ContentState _returnNewState(ContentState state) {
    return ContentState(
        files: state.files,
        folders: state.folders,
        error: state.error,
        uploadFile: state.uploadFile,
        search: state.search);
  }
}

class ContentInit extends BlocEvent {
  final List<FileFind> files;
  final List<FolderFind> folders;

  const ContentInit({required this.files, required this.folders});
}

class ContentPush extends BlocEvent {
  final List<FileFind> files;
  final List<FolderFind> folders;

  const ContentPush({required this.files, required this.folders});
}

class UploadFileSet extends BlocEvent {
  final FileUpload data;
  final int? id;

  const UploadFileSet({required this.data, required this.id});
}

class UploadFileRemove extends BlocEvent {
  final int? folderId;
  final int id;

  const UploadFileRemove({required this.folderId, required this.id});
}

class UploadSetCallback extends BlocEvent {
  final int? folderId;
  final int id;
  final callback;

  const UploadSetCallback(
      {required this.id, required this.folderId, required this.callback});
}

class SetSearch extends BlocEvent {
  final String search;

  SetSearch({required this.search});
}

class SetError extends BlocEvent {
  final bool error;

  SetError({required this.error});
}
