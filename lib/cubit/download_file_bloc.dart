import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';

class BlocEvent {
  const BlocEvent();
}

class DownloadFileState {
  Map<int, FileDownload?> downloadFile = {};


  DownloadFileState({
    required this.downloadFile,
  });
}

class DownloadFileBloc extends Bloc<BlocEvent, DownloadFileState> {
  DownloadFileBloc({required DownloadFileState state})
      : super(DownloadFileState(downloadFile: state.downloadFile)) {
    on<FolderDownloadFile>(_addDownload);
    on<FolderSetSizeDownloadFile>(_setSizeDownload);
    on<FolderRemoveDownloadFile>(_removeDownload);
    on<FolderSetStatus>(_setStatusDownload);
    on<FolderSetCallback>(_setCallbackDownload);
    on<FolderRemoveDownloadFiles>(_removeAllDownload);
  }

  void _addDownload(FolderDownloadFile event, Emitter<DownloadFileState> emit) {
    state.downloadFile[event.id] = event.downloadFile;
    emit(DownloadFileState(downloadFile: state.downloadFile));
  }

  void _setSizeDownload(
      FolderSetSizeDownloadFile event, Emitter<DownloadFileState> emit) {
    state.downloadFile[event.id]?.size = event.size;
    emit(DownloadFileState(downloadFile: state.downloadFile));
  }

  void _removeDownload(
      FolderRemoveDownloadFile event, Emitter<DownloadFileState> emit) {
    state.downloadFile.remove(event.id);
    emit(DownloadFileState(downloadFile: state.downloadFile));
  }

  void _setStatusDownload(FolderSetStatus event, Emitter<DownloadFileState> emit) {
    state.downloadFile[event.id]?.status = event.status;
    emit(DownloadFileState(downloadFile: state.downloadFile));
  }

  void _setCallbackDownload(
      FolderSetCallback event, Emitter<DownloadFileState> emit) {
    state.downloadFile[event.id]?.callback = event.callback;
    emit(DownloadFileState(downloadFile: state.downloadFile));
  }

  void _removeAllDownload(
      FolderRemoveDownloadFiles event, Emitter<DownloadFileState> emit) {
    state.downloadFile = {};
    emit(state);
  }
}

class FolderDownloadFile extends BlocEvent {
  final FileDownload downloadFile;
  final int id;

  FolderDownloadFile({required this.downloadFile, required this.id});
}

class FolderSetSizeDownloadFile extends BlocEvent {
  final int id;
  final double size;

  FolderSetSizeDownloadFile({required this.id, required this.size});
}

class FolderRemoveDownloadFile extends BlocEvent {
  final int id;

  FolderRemoveDownloadFile({required this.id});
}

class FolderSetStatus extends BlocEvent {
  final int id;
  final FileDownloadStatus status;

  FolderSetStatus({required this.id, required this.status});
}

class FolderSetCallback extends BlocEvent {
  final int id;
  final ResponseStream<FileDownloadResponse> callback;

  FolderSetCallback({required this.id, required this.callback});
}

class FolderRemoveDownloadFiles extends BlocEvent {
  const FolderRemoveDownloadFiles();
}
