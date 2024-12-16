import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEvent {
  const BlocEvent();
}

class UploadFileState {
  Map<int, AddUploadFile> chatUploadFiles = {};

  UploadFileState({
    required this.chatUploadFiles,
  });
}

class UploadFileBloc extends Bloc<BlocEvent, UploadFileState> {
  UploadFileBloc({required UploadFileState state})
      : super(UploadFileState(chatUploadFiles: state.chatUploadFiles)) {
    on<AddUploadFile>(_addFileUpload);
    on<RemoveUploadFile>(_removeKey);
  }

  void _addFileUpload(AddUploadFile event, Emitter<UploadFileState> emit) {
    state.chatUploadFiles[event.id] = event;
    emit(UploadFileState(chatUploadFiles: state.chatUploadFiles));
  }

  void _removeKey(RemoveUploadFile event, Emitter<UploadFileState> emit) {
    state.chatUploadFiles.remove(event.messageId);
    emit(UploadFileState(chatUploadFiles: state.chatUploadFiles));
  }
}

class AddUploadFile extends BlocEvent {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String text;
  final User user;
  final List<ChatFile> chatFiles; 

  AddUploadFile(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.user,
      required this.chatFiles,
      required this.text});
}

class RemoveUploadFile extends BlocEvent {
  final int messageId;

  RemoveUploadFile({required this.messageId});
}