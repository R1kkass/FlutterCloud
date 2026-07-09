import 'package:TalkSpace/domain/model/entities/chat.dart';
import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class CommonChatAcceptDisallow extends ChangeNotifier {
  late ChatRepository _chatRepository;

  CommonChatAcceptDisallow({
    required ChatRepository chatRepository
  }) {
    _chatRepository = chatRepository;
  }

  List<Chat> _chats = [];
  List<Chat> get chats => _chats;
  bool isLoading = false;
  bool isError = false;


  Future update() async {
    try {
      isLoading = true;
      notifyListeners();
      _chats = (await _chatRepository.getUnSuccessChats()).chats;
    } catch (e) {
      isError = true;
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}