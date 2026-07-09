import 'package:TalkSpace/domain/model/request/get_messages_request.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/index.dart';
import 'package:flutter/material.dart';

class NotificationScrollViewModel extends ChangeNotifier {
  late ChatFloatButtonScrollBottomViewModel chatFloatButtonScrollBottomViewModel;

  update({
    required ChatFloatButtonScrollBottomViewModel chatFloatButtonScrollBottomViewModel,
  }) {
    this.chatFloatButtonScrollBottomViewModel = chatFloatButtonScrollBottomViewModel;
  }

  bool notificationScroll(t, int chatId) {
    ChatViewModel chatViewModel = chatFloatButtonScrollBottomViewModel.chatViewModel;
    if (t is ScrollStartNotification && !chatViewModel.scrolling) {
      chatViewModel.currPosition = t.metrics.pixels;
    }
    if (t is ScrollUpdateNotification && !chatViewModel.scrolling) {
      if (chatViewModel.currPosition > t.metrics.pixels && !chatFloatButtonScrollBottomViewModel.showButton) {
        chatFloatButtonScrollBottomViewModel.setShow(true);
      } else if (chatViewModel.currPosition < t.metrics.pixels && chatFloatButtonScrollBottomViewModel.showButton) {
        chatFloatButtonScrollBottomViewModel.setShow(false);
      }
    }

    if (t is ScrollEndNotification && t.metrics.pixels == chatViewModel.scrollController.position.maxScrollExtent) {
      chatViewModel.page++;
      chatViewModel.getMessages(GetMessagesRequest(chatId: chatId, page: chatViewModel.page, init: false));
    }
    if (t is ScrollEndNotification && t.metrics.pixels == 0.0) {
      if (chatFloatButtonScrollBottomViewModel.showButton) {
        chatFloatButtonScrollBottomViewModel.setShow(false);
      }
      if (chatViewModel.pageBottom > 0) {
        chatViewModel.pageBottom--;
        chatViewModel.getMessages(GetMessagesRequest(chatId: chatId, page: chatViewModel.pageBottom, init: false));
      }
    }
    return true;
  }
}
