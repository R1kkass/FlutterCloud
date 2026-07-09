import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SendRequestToCreateChatViewModel extends ChangeNotifier {
  late ChatRepository _chatRepository;

  SendRequestToCreateChatViewModel({
    required ChatRepository chatRepository
  }) {
    _chatRepository = chatRepository;
  }

  createChat(String companionUuid) async {
    await _chatRepository.createChat(companionUuid);
  }
}
