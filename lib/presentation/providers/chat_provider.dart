import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:TalkSpace/domain/repository/message_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/index.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/notification_scroll_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatProvider extends StatelessWidget {
  final Widget? child;
  final int chatId;

  const ChatProvider({
    super.key,
    required this.child,
    required this.chatId
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProxyProvider<ChatRepository, ChatViewModel> (
          create: (context) => ChatViewModel(),
          update: (_, chatRepository, chatVM) => chatVM!..update(
            chatRepository: chatRepository,
          )
        ),

        ChangeNotifierProxyProvider<ChatViewModel, ChatFloatButtonScrollBottomViewModel>(
          create: (context) => ChatFloatButtonScrollBottomViewModel(),
          update: (_, chatVM, chatFloatButtonScrollBottomVM) => chatFloatButtonScrollBottomVM!..update(chatVM),
        ),

        ChangeNotifierProxyProvider2<MessageRepository, ChatViewModel, UploadFileViewModel> (
            create: (context) => UploadFileViewModel(),
            update: (_, messageRepository, chatVM, uploadFileVM) => uploadFileVM!..update(
              chatViewModel: chatVM,
              messageRepository: messageRepository,
            )
        ),

        ChangeNotifierProxyProvider<UploadFileViewModel, FileGalleryViewModel>(
          create: (context) => FileGalleryViewModel(),
          update: (_, uploadFileVM, fileGalleryVM) => fileGalleryVM!..updateUploadFileViewModel(uploadFileVM),
        ),

        ChangeNotifierProxyProvider<ChatFloatButtonScrollBottomViewModel, NotificationScrollViewModel>(
          create: (context) => NotificationScrollViewModel(),
          update: (_, chatFloatButtonScrollBottomVM, notificationScrollVM) => notificationScrollVM!..update(chatFloatButtonScrollBottomViewModel: chatFloatButtonScrollBottomVM),
        ),
      ],
      child: child,
    );
  }
}
