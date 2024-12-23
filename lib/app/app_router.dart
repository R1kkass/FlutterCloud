import 'package:flutter/material.dart';
import 'package:TalkSpace/pages/auth.dart';
import 'package:TalkSpace/pages/change_user.dart';
import 'package:TalkSpace/pages/chat.dart';
import 'package:TalkSpace/pages/chats_list.dart';
import 'package:TalkSpace/pages/downloadings.dart';
import 'package:TalkSpace/pages/files_users.dart';
import 'package:TalkSpace/pages/home.dart';
import 'package:TalkSpace/pages/image_viewer.dart';
import 'package:TalkSpace/pages/open_file.dart';
import 'package:TalkSpace/pages/registration.dart';
import 'package:TalkSpace/pages/search_users.dart';
import 'package:TalkSpace/pages/splash.dart';

class AppRouter {
  static const SEARCH_USERS = "/searchusers";
  static const HOME = "/home";
  static const FILE = "/file";
  static const REGISTRATION = "/registration";
  static const AUTH = "/auth";
  // static const FILES_USERS = "/filesusers";
  static const CHAT = "/chat";
  static const CHAT_LIST = "/chatlist";
  static const CHANGE_ACCOUNT = "/changeaccount";
  static const DOWNLOAD = "/download";
  static const IMAGE_VIEWER = "/imageviewer";

  static var routes = {
    "/": (context) => const Splash(title: "Загрузка"),
    AUTH: (context) => const Authorization(title: "Авторизация"),
    REGISTRATION: (context) => const Registration(title: "Регистрация"),
    HOME: (context) => const Home(title: "Облако"),
    FILE: (context) => const Openfile(title: "Файл"),
    SEARCH_USERS: (context) => const SearchUsers(title: "Поиск пользователей"),
    // FILES_USERS: (context) => FilesUsers(
    //     title: "Файлы пользователей",
    //     args: ModalRoute.of(context)!.settings.arguments as ArgsFilesUsers),
    CHAT: (context) => ChatPage(
          title: "Чат",
          args: ModalRoute.of(context)!.settings.arguments as ChatArgument,
        ),
    CHAT_LIST: (context) => const ChatLists(title: "Чаты"),
    CHANGE_ACCOUNT: (context) =>
        const ChangeUser(title: "Сменить пользователя"),
    DOWNLOAD: (context) => const Downloadings(title: "Загрузки"),
    IMAGE_VIEWER: (context) => const ImageViewer(title: "Фото"),
  };
}
