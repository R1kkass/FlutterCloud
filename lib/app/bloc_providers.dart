import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/cubit/count_bloc.dart';
import 'package:TalkSpace/cubit/current_page_bloc.dart';
import 'package:TalkSpace/cubit/download_file_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/cubit/registration_bloc.dart';
import 'package:TalkSpace/cubit/space_cubit.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/cubit/upload_file_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class BlockProviders {
  static List<SingleChildWidget> blockProviders = [
    BlocProvider(
      create: (context) => FolderCubit(),
    ),
    BlocProvider(
      create: (context) => ContentBloc(
          state: ContentState(
              files: [],
              folders: [],
              error: false,
              uploadFile: {},
              search: "")),
    ),
    BlocProvider(
      create: (context) =>
          DownloadFileBloc(state: DownloadFileState(downloadFile: {})),
    ),
    BlocProvider(
      create: (context) =>
          UploadFileBloc(state: UploadFileState(chatUploadFiles: {})),
    ),
    BlocProvider(
      create: (context) => CountBloc(state: CountState(count: 0)),
    ),
    BlocProvider(
      create: (context) => RegistrationBloc(
          state: RegistrationState(email: "", password: "")),
    ),
    BlocProvider(
      create: (context) => CurrentPageBloc(state: CurrentPageState(page: 0)),
    ),
    BlocProvider(
      create: (context) => TokenCubit(),
    ),
    BlocProvider(
      create: (context) => SpaceCubit(),
    ),
  ];
}
