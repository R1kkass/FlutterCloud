import 'package:TalkSpace/data/repository/auth_grpc.dart';
import 'package:TalkSpace/data/repository/chat_grpc.dart';
import 'package:TalkSpace/data/repository/files_grpc.dart';
import 'package:TalkSpace/data/repository/folder_grpc.dart';
import 'package:TalkSpace/data/repository/keys_grpc.dart';
import 'package:TalkSpace/data/repository/message_grpc.dart';
import 'package:TalkSpace/data/sources/local/chat_public_keys_local_data_source.dart';
import 'package:TalkSpace/data/sources/local/chat_secret_keys_local_data_source.dart';
import 'package:TalkSpace/data/sources/local/message_file_local_data_source.dart';
import 'package:TalkSpace/data/sources/local/session_local_data_source.dart';
import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:TalkSpace/domain/repository/message_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/index.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/folder/index.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/index.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/chat/index.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/count_badge_view_model.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/index.dart';
import 'package:TalkSpace/presentation/viewmodels/user/index.dart';
import 'package:TalkSpace/presentation/viewmodels/user/logout_button_view_model.dart';
import 'package:TalkSpace/presentation/viewmodels/user/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiIocWidgetService extends StatelessWidget {
  final Widget child;

  const MultiIocWidgetService({super.key, required  this.child});

  @override
  Widget build(BuildContext context) {
    final keysRepository = KeysGrpc(chatSecretKeysLocalDataSource: ChatSecretKeysLocalDataSource());
    final chatRepository = ChatGrpc(chatSecretKeysLocalDataSource: ChatSecretKeysLocalDataSource(), chatPublicKeysLocalDataSource: ChatPublicKeysLocalDataSource(), keysRepository: keysRepository);
    final messageRepository = MessageGrpc(chatSecretKeysLocalDataSource: ChatSecretKeysLocalDataSource());
    final authRepository = AuthGrpc(sessionLocalDataSource: SessionLocalDataSource());
    final folderRepository = FolderGrpc();
    final fileRepository = FilesGrpc();

    return MultiProvider(
      providers: [
        Provider<MessageRepository>(create: (context) => messageRepository),
        Provider<ChatRepository>(create: (context) => chatRepository),
        Provider<MessageFileLocalDataSource>(create: (context) => MessageFileLocalDataSource()),

        ChangeNotifierProvider(create: (context) => CommonCloudData(fileRepository: fileRepository), ),
        ChangeNotifierProvider(create: (context) => CommonRegistration(), ),
        ChangeNotifierProvider(create: (context) => CommonUploadFiles(), ),
        ChangeNotifierProvider(create: (context) => CommonFileDownload(), ),
        ChangeNotifierProvider(create: (context) => CommonChatAcceptDisallow(chatRepository: chatRepository), ),
        ChangeNotifierProvider(create: (context) => CommonToken(authRepository: authRepository), ),

        ChangeNotifierProvider(create: (context) => ChatListMessagesViewModel(chatRepository: chatRepository)),
        ChangeNotifierProvider(create: (context) => SubmitRegistrationMailButtonViewModel(keysRepository: keysRepository, authRepository: authRepository)),
        ChangeNotifierProvider(create: (context) => GetSpaceViewModel(fileRepository: fileRepository)),
        ChangeNotifierProvider(create: (context) => CountBadgeViewModel(chatRepository: chatRepository)),
        ChangeNotifierProvider(create: (context) => LogoutButtonViewModel(authRepository: authRepository)),
        ChangeNotifierProvider(create: (context) => SendRequestToCreateChatViewModel(chatRepository: chatRepository)),

        ChangeNotifierProxyProvider2<CommonFileDownload, CommonCloudData, CloudListViewModel>(
            create: (context) => CloudListViewModel(),
            update: (_, commonFileDownload, commonCloudData, cloudListVM) =>
              cloudListVM!..updateProperty(commonFileDownload: commonFileDownload, commonCloudData: commonCloudData),
        ),

        ChangeNotifierProxyProvider<CommonCloudData, MoveToMainViewModel> (
          create: (context) => MoveToMainViewModel(folderRepository: folderRepository, fileRepository: fileRepository),
          update: (_, commonCloudData, moveToMainVM) => moveToMainVM!..updateCommonCloudData(commonCloudData),
        ),

        ChangeNotifierProxyProvider<CommonToken, LogoutButtonViewModel> (
          create: (context) => LogoutButtonViewModel(authRepository: authRepository),
          update: (_, commonCloudData, logoutButtonVM) => logoutButtonVM!..updateCommonToken(commonCloudData),
        ),

        ChangeNotifierProxyProvider2<CommonRegistration, CommonToken, SubmitRegistrationMailButtonViewModel> (
          create: (context) => SubmitRegistrationMailButtonViewModel(keysRepository: keysRepository, authRepository: authRepository),
          update: (_, commonRegistration, commonToken, submitRegistrationMailButtonVM) => submitRegistrationMailButtonVM!..updateCommonProperty(commonRegistration: commonRegistration, commonToken: commonToken),
        ),

        ChangeNotifierProxyProvider<CommonCloudData, CreateFolderViewModel> (
          create: (context) => CreateFolderViewModel(folderRepository: folderRepository, fileRepository: fileRepository),
          update: (_, commonCloudData, createFolderVM) => createFolderVM!..updateCommonCloudData(commonCloudData),
        ),

        ChangeNotifierProxyProvider<CommonChatAcceptDisallow, ChatAcceptButtonViewModel> (
          create: (context) => ChatAcceptButtonViewModel(chatRepository: chatRepository),
          update: (_, commonChatAcceptDisallow, chatAcceptButtonVM) => chatAcceptButtonVM!..updateCommonChatAcceptDisallow(commonChatAcceptDisallow),
        ),

        ChangeNotifierProxyProvider<CommonChatAcceptDisallow, ChatDisallowButtonViewModel> (
          create: (context) => ChatDisallowButtonViewModel(chatRepository: chatRepository),
          update: (_, commonChatAcceptDisallow, chatDisallowButtonVM) => chatDisallowButtonVM!..updateCommonChatAcceptDisallow(commonChatAcceptDisallow),
        ),

        ChangeNotifierProxyProvider<CommonToken, SplashViewModel> (
          create: (context) => SplashViewModel(),
          update: (_, commonToken, splashVM) => splashVM!..updateCommonToken(commonToken),
        ),

        ChangeNotifierProxyProvider<CommonToken, SubmitLoginViewModel> (
          create: (context) => SubmitLoginViewModel(authRepository: authRepository),
          update: (_, commonToken, submitLoginVM) => submitLoginVM!..updateCommonToken(commonToken),
        ),

        ChangeNotifierProxyProvider<CommonRegistration, SubmitRegistrationModelView> (
          create: (context) => SubmitRegistrationModelView(authRepository: authRepository),
          update: (_, commonRegistration, submitRegistrationVM) => submitRegistrationVM!..updateCommonRegistration(commonRegistration),
        ),
      ],
      child: child,
    );
  }
}