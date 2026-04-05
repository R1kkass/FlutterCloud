import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/views/splash.dart';
import 'package:TalkSpace/presentation/views/auth.dart';
import 'package:TalkSpace/presentation/views/change_user.dart';
import 'package:TalkSpace/presentation/views/chat.dart';
import 'package:TalkSpace/presentation/views/chats_list.dart';
import 'package:TalkSpace/presentation/views/downloadings.dart';
import 'package:TalkSpace/presentation/views/cloud.dart';
import 'package:TalkSpace/presentation/views/image_viewer.dart';
import 'package:TalkSpace/presentation/views/open_file.dart';
import 'package:TalkSpace/presentation/views/registration.dart';
import 'package:TalkSpace/presentation/views/search_users.dart';
import 'package:TalkSpace/presentation/views/submit_key_registration.dart';

class AppRouter {
  static const SEARCH_USERS = "/searchusers";
  static const CLOUD = "/cloud";
  static const FILE = "/file";
  static const REGISTRATION = "/registration";
  static const AUTH = "/auth";
  static const CHAT = "/chat";
  static const CHAT_LIST = "/chatlist";
  static const CHANGE_ACCOUNT = "/changeaccount";
  static const SPLASH = "/";
  static const DOWNLOAD = "/download";
  static const IMAGE_VIEWER = "/imageviewer";
  static const SUBMIT_KEY_REGISTRATION = "/submitkey";

  static var routes = {
    SPLASH: (context) => const Splash(title: "Загрузка"),
    AUTH: (context) => const Authorization(title: "Авторизация"),
    REGISTRATION: (context) => const Registration(title: "Регистрация"),
    CLOUD: (context) => const Cloud(title: "Облако"),
    FILE: (context) => const Openfile(title: "Файл"),
    SEARCH_USERS: (context) => const SearchUsers(title: "Поиск пользователей"),
    CHAT: (context) => ChatPage(
          title: "Чат",
          args: ModalRoute.of(context)!.settings.arguments as ChatArgument,
        ),
    CHAT_LIST: (context) => const ChatLists(title: "Чаты"),
    CHANGE_ACCOUNT: (context) =>
        const ChangeUser(title: "Сменить пользователя"),
    DOWNLOAD: (context) => const Downloadings(title: "Загрузки"),
    IMAGE_VIEWER: (context) => const ImageViewer(title: "Фото"),
    SUBMIT_KEY_REGISTRATION: (context) =>
        const SubmitKeyRegistration(title: "Подтверждение")
  };
}
