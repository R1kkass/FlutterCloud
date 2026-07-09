enum NotificationAction {
  newChat,
  newMessage;

  static NotificationAction? toEnum(String type) {
    switch(type) {
      case "new_message":
        return newMessage;
      case "new_chat":
        return newChat;
    }
    return null;
  }
}

