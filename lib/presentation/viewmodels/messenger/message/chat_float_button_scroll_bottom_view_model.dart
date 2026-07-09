import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_view_model.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class ChatFloatButtonScrollBottomViewModel extends ChangeNotifier {
  bool showButton = false;
  late ChatViewModel chatViewModel;

  setShow(bool value) {
    showButton = value;
    notifyListeners();
  }

  update(ChatViewModel chatViewModel) {
    this.chatViewModel = chatViewModel;
  }

  scrollDown() {
    chatViewModel.scrolling = true;
    chatViewModel.scrollController.animateTo(
      chatViewModel.scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    ).then((e) {
      chatViewModel.scrolling = false;
    });
    setShow(false);
    if (chatViewModel.countNotReadingMessages > 0) {
      chatViewModel.readAll();
    }
  }
}
