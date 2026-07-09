import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/enums/message_status_enum.dart';
import 'package:TalkSpace/domain/model/enums/type_message.enum.dart';
import 'package:TalkSpace/domain/model/request/get_messages_request.dart';
import 'package:TalkSpace/domain/repository/chat_message_manager.dart';
import 'package:TalkSpace/domain/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier {
  late ChatRepository _chatRepository;

  final ScrollController scrollController = ScrollController();
  var page = 0;
  var pageBottom = 0;
  var count = 0;
  var isLoading = true;
  var isError = false;
  ChatMessageManager? chatMessageManager;
  Messages messages = Messages();
  bool scrolling = false;
  double currPosition = 0.0;

  int countNotReadingMessages = 0;
  final GlobalKey<AnimatedListState> key = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    messages = Messages();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await chatMessageManager?.cancel();
      await chatMessageManager?.controller.close();
    });
  }

  update({
    required ChatRepository chatRepository,
  }) {
    _chatRepository = chatRepository;
  }

  initChat(int chatId) async {
    try {
      isLoading = true;
      notifyListeners();
      await getMessages(GetMessagesRequest(chatId: chatId, page: page, init: false));
      chatMessageManager = await _chatRepository.streamGetMessages(chatId, (onData) {
        var message = onData.message;
        switch (onData.type) {
          case TypeMessage.SEND_MESSAGE:
            messages.messages.insert(0, message);
            key.currentState?.insertItem(0);
            break;
          case TypeMessage.UPLOAD_MESSAGE:
            messages.messages.insert(0, message);
            key.currentState?.insertItem(0);
            break;
          case TypeMessage.READ_MESSAGE:
            if (onData.messages.isNotEmpty) {
              var index = messages.messages.indexWhere((message) => onData.messages.last.id == message.id);

              if (index >= 0) {
                var readMessages = messages.messages.sublist(index + 1);
                messages.messages = [...onData.messages, ...readMessages];
                notifyListeners();
              }
            }
            break;
          case TypeMessage.READ_MESSAGE_ALL:
            for (var dataMessage in onData.messages) {
              for (var message in messages.messages) {
                if (dataMessage.id == message.id) {
                  message = dataMessage;
                }
              }
            }
            notifyListeners();
          break;
        }
      });

      chatMessageManager!.controller.stream.handleError((e) {
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
  }

  readAll() {
    chatMessageManager?.readAll();
    countNotReadingMessages = 0;
    notifyListeners();
  }

  readMessage(int messageId) {
    chatMessageManager?.readMessage(messageId);
    countNotReadingMessages -= 1;
    notifyListeners();
  }

  addMessage(String text) {
    chatMessageManager?.addMessage(text);
  }
  
  getMessages(GetMessagesRequest request) async {
    var response = await _chatRepository.getMessages(request);
    messages.messages = [...messages.messages, ...response.messages, ...messages.uploadMessages];

    // notifyListeners();
    countNotReadingMessages = response.countNotRead;
    key.currentState?.insertAllItems(0, response.messages.length);
  }

  addUploadMessage(Message message) {
    messages.uploadMessages.add(message);
    // notifyListeners();
    key.currentState?.insertItem(0);
  }

  successUploadMessage(Message message, Message uploadedMessage) async {
    messages.uploadMessages.remove(message);
    await chatMessageManager?.addUploadFile(uploadedMessage.id);

    notifyListeners();
  }

  errorUploadMessage(Message message) {
    messages.uploadMessages.firstWhere((uploadMessage) => uploadMessage.id == message.id).status = MessageStatusEnum.error;
    notifyListeners();
  }
}

class Messages {
  List<Message> messages = [];
  List<Message> uploadMessages = [];

  get length => messages.length + uploadMessages.length;
}
