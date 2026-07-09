import 'package:TalkSpace/data/sources/local/message_file_local_data_source.dart';
import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/domain/repository/message_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_file_view_model.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MessageFileDefaultProvider extends StatelessWidget {
  final Widget child;
  final MessageFile messageFile;

  const MessageFileDefaultProvider({
    super.key,
    required this.child,
    required this.messageFile
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider2<MessageRepository, MessageFileLocalDataSource, ChatFileViewModel>(
      create: (context) => ChatFileViewModel(),
      update: (_, messageRepository, messageFileLocalDataSource, chatFileVM) => chatFileVM!..update(
        messageRepository: messageRepository,
        messageFileLocalDataSource: messageFileLocalDataSource,
        messageFile: messageFile,
      ),
      child: child,
    );
  }
}