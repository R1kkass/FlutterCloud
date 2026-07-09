import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_view_model.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/message.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MessageAnimationTransform extends StatelessWidget {
  final Message message;
  final Animation<double> animation;
  final Widget icon;

  const MessageAnimationTransform({
    super.key,
    required this.message,
    required this.icon,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    var id = message.id;
    return Consumer<ChatViewModel>(
      builder: (context, viewModel, child) {
        return VisibilityDetector(
          key: Key("$id"),
          onVisibilityChanged: (visibilityInfo) {
            if (!message.statusRead && message.user.email != jwtDecode().email) {
              viewModel.readMessage(id);
            }
          },
          child: FadeTransition(
            key: ValueKey<int>(id),
            opacity: animation,
            child: SizeTransition(
              key: UniqueKey(),
              sizeFactor: animation,
              child: MessageComponent(
                message: message,
                isCurrentUser: jwtDecode().email == message.user.email,
                icon: icon,
              ),
            ),
          ),
        );
      });
  }
}