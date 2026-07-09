import 'package:TalkSpace/domain/model/entities/chat.dart';
import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/chat/chat_submit/common_chat_submit.dart';
import 'package:flutter/material.dart';

class ChatAcceptButtonViewModel extends ChangeNotifier {
  late ChatRepository _chatRepository;
  bool isLoading = false;
  late CommonChatAcceptDisallow commonChatAcceptDisallow;

  ChatAcceptButtonViewModel({
    required chatRepository,
  }) {
    _chatRepository = chatRepository;
  }

  updateCommonChatAcceptDisallow(CommonChatAcceptDisallow commonChatAcceptDisallow) {
    this.commonChatAcceptDisallow = commonChatAcceptDisallow;
  }

  Future acceptChat(Chat chat) async {
    try {
      isLoading = true;
      notifyListeners();
      await _chatRepository.acceptChat(chat.id);
      await commonChatAcceptDisallow.update();
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
