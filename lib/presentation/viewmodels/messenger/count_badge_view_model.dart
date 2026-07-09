import 'dart:async';

import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:flutter/foundation.dart';

class CountBadgeViewModel extends ChangeNotifier {
  late ChatRepository _chatRepository;

  CountBadgeViewModel({
    required ChatRepository chatRepository
  }) {
    _chatRepository = chatRepository;
  }

  int _countNotReadingChats = 0;
  int get countNotReadingChats => _countNotReadingChats;
  StreamSubscription? stream;

  getStreamCount() async {
    stream = await _chatRepository.streamGetMessagesGeneral((count) {
      _countNotReadingChats = count;
      notifyListeners();
    });
  }


  @override
  void dispose() {
    super.dispose();
    stream?.cancel();
  }
}
