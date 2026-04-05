import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/gen/dart/google/protobuf/timestamp.pb.dart';
import 'package:TalkSpace/gen/dart/user/user.pb.dart';
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
    on<SuccessUploadFile>(_successUploadFile);
  }

  void _addFileUpload(AddUploadFile event, Emitter<UploadFileState> emit) {
    state.chatUploadFiles[event.id] = event;
    emit(UploadFileState(chatUploadFiles: state.chatUploadFiles));
  }

  void _removeKey(RemoveUploadFile event, Emitter<UploadFileState> emit) {
    state.chatUploadFiles.remove(event.messageId);
    emit(UploadFileState(chatUploadFiles: state.chatUploadFiles));
  }

  void _successUploadFile(
      SuccessUploadFile event, Emitter<UploadFileState> emit) {
    state.chatUploadFiles[event.id]?.successFiles[event.filePath] = true;
    emit(UploadFileState(chatUploadFiles: state.chatUploadFiles));
  }
}

class AddUploadFile extends BlocEvent {
  final int id;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final String text;
  final User user;
  final Map<String, bool> successFiles;
  final List<MessageFile> messageFiles;

  AddUploadFile(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.user,
      required this.successFiles,
      required this.text, required this.messageFiles});
}

class RemoveUploadFile extends BlocEvent {
  final int messageId;

  RemoveUploadFile({required this.messageId});
}

class SuccessUploadFile extends BlocEvent {
  final String filePath;
  final int id;

  const SuccessUploadFile({required this.filePath, required this.id});
}
