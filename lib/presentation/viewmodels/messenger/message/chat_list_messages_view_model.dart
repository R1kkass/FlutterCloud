import 'dart:async';

import 'package:TalkSpace/domain/model/entities/chat_with_count_and_last_message.dart';
import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:flutter/cupertino.dart';

class ChatListMessagesViewModel extends ChangeNotifier {
  late ChatRepository _chatRepository;

  ChatListMessagesViewModel({
    required chatRepository,
  }) {
    _chatRepository = chatRepository;
  }

  bool isLoading = false;
  bool isError = false;

  List<ChatWithCountAndLastMessage> chats = [];
  StreamSubscription? stream;

  @override
  void dispose() async {
    super.dispose();
    await stream?.cancel();
  }

  Future<StreamSubscription?> streamGetChats() async {
    try {
      isLoading = true;
      notifyListeners();
      stream = await _chatRepository.streamGetChat((data) async {
        chats = data.chats;
        notifyListeners();
      });

      stream!.onError((e) {
        isError = true;
        notifyListeners();
      });
      isError = false;
    } catch (e) {
      isError = true;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return stream;
  }
}