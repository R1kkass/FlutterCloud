import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/pages/auth.dart';
import 'package:flutter_application_2/pages/change_user.dart';
import 'package:flutter_application_2/pages/chat.dart';
import 'package:flutter_application_2/pages/chats_list.dart';
import 'package:flutter_application_2/pages/downloadings.dart';
import 'package:flutter_application_2/pages/files_users.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/open_file.dart';
import 'package:flutter_application_2/pages/registration.dart';
import 'package:flutter_application_2/pages/search_users.dart';

var routes = {
  AUTH: (context) => const Authorization(title: "Авторизация"),
  REGISTRATION: (context) => const Registration(title: "Регистрация"),
  '/': (context) => const Home(title: "Главная"),
  FILE: (context) => const Openfile(title: "Файл"),
  SEARCH_USERS: (context) => const SearchUsers(title: "Поиск пользователей"),
  FILES_USERS: (context) => FilesUsers(
      title: "Файлы пользователей",
      args: ModalRoute.of(context)!.settings.arguments as ArgsFilesUsers),
  CHAT: (context) => ChatPage(
        title: "Чат",
        args: ModalRoute.of(context)!.settings.arguments as ChatArgument,
      ),
  CHAT_LIST: (context) => const ChatLists(title: "Чаты"),
  CHANGE_ACCOUNT: (context) => const ChangeUser(title: "Сменить пользователя"),
  DOWNLOAD: (context) => const Downloadings(title: "Загрузки")
};
