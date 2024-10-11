// import 'package:flutter_application_2/cubit/folder_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BlocEvent {
//   const BlocEvent();
// }

// class UploadState {
//   Map<int, Map<int, FileUpload?>> uploadFile;

//   UploadState({required this.uploadFile});
// }

// class UploadBloc extends Bloc<BlocEvent, UploadState> {
//   UploadBloc({required state}) : super(UploadState(uploadFile: {})) {
//     on<UploadFileSet>(_setUploadFile);
//     on<UploadFileRemove>(_removeUploadFile);
//     on<UploadSetCallback>(_setCallbackUploadFile);
//   }

//   void _setUploadFile(UploadFileSet event, Emitter<UploadState> emit) {
//     var id = event.id ?? 0;
//     if (state.uploadFile[id] == null) {
//       state.uploadFile[id] = {};
//     }
//     state.uploadFile[id]?[event.data.id] = event.data;
//     emit(state);
//   }

//   void _removeUploadFile(UploadFileRemove event, Emitter<UploadState> emit) {
//     var folderId = event.folderId ?? 0;
//     state.uploadFile[folderId]?.remove(event.id);
//     emit(state);
//   }

//   void _setCallbackUploadFile(
//       UploadSetCallback event, Emitter<UploadState> emit) {
//     var folderId = event.folderId ?? 0;
//     state.uploadFile[folderId]?[event.id]?.callback = event.callback;
//     emit(state);
//   }
// }

// class UploadFileSet extends BlocEvent {
//   final FileUpload data;
//   final int? id;

//   const UploadFileSet({required this.data, required this.id});
// }

// class UploadFileRemove extends BlocEvent {
//   final int? folderId;
//   final int id;

//   const UploadFileRemove({required this.folderId, required this.id});
// }

// class UploadSetCallback extends BlocEvent {
//   final int? folderId;
//   final int id;
//   final callback;

//   const UploadSetCallback(
//       {required this.id, required this.folderId, required this.callback});
// }
