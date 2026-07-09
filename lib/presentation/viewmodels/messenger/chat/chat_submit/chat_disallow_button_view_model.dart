import 'package:TalkSpace/domain/model/entities/chat.dart';
import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/chat/chat_submit/common_chat_submit.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/foundation.dart';

class ChatDisallowButtonViewModel extends ChangeNotifier {
  bool isLoading = false;
  late ChatRepository _chatRepository;
  late CommonChatAcceptDisallow commonChatAcceptDisallow;

  ChatDisallowButtonViewModel({
    required chatRepository,
  }) {
    _chatRepository = chatRepository;
  }

  updateCommonChatAcceptDisallow(CommonChatAcceptDisallow commonChatAcceptDisallow) {
    this.commonChatAcceptDisallow = commonChatAcceptDisallow;
  }

  Future disallow(Chat chat) async {
    try {
      isLoading = true;
      notifyListeners();
      await _chatRepository.disallowChat(chat.id);
      await commonChatAcceptDisallow.update();
    } catch (e) {
      showUnsuccessToast("Не удалось отклонить");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
