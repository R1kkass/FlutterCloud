import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/consts/domen.dart';
import 'package:flutter_application_2/consts/links.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/cubit/space_cubit.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:flutter_application_2/observers/observer.dart';
import 'package:flutter_application_2/pages/auth.dart';
import 'package:flutter_application_2/pages/change_user.dart';
import 'package:flutter_application_2/pages/chat.dart';
import 'package:flutter_application_2/pages/chats_list.dart';
import 'package:flutter_application_2/pages/files_users.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/open_file.dart';
import 'package:flutter_application_2/pages/registration.dart';
import 'package:flutter_application_2/pages/search_users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

ClientChannel channel = ClientChannel(
  ipServer,
  port: 50051,
  options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // channel = await chan();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  await Hive.initFlutter();
  await Hive.openBox('token');
  await Hive.openBox('list_token');
  await Hive.openBox('pubkey');
  await Hive.openBox('secretkey');
  Bloc.observer = const MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => FolderCubit(),
    ),
    BlocProvider(
      create: (context) => TokenCubit(),
    ),
    BlocProvider(
      create: (context) => SpaceCubit(),
    ),
  ], child: const MyApp()));
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var access_token = Hive.box('token').get('access_token');

  void _token(String? token) {
    setState(() {
      access_token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? token = context.read<TokenCubit>().state;
    if (token?.length == 0) {
      context.read<TokenCubit>().updateToken(access_token);
    }
    _token(Hive.box('token').get('access_token'));
    return MaterialApp(
      theme: ThemeData(
        primaryTextTheme: Typography().black,
        textTheme: Typography().black,
        colorScheme: ColorScheme(
            primary: Colors.deepOrange.shade400,
            secondary: const Color.fromARGB(255, 83, 83, 83),
            onSecondary: Colors.white,
            error: Colors.white,
            onError: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
            onPrimary: Colors.white,
            brightness: Brightness.light),
        indicatorColor: Colors.deepOrange.shade800,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange.shade100,
            foregroundColor: Colors.deepOrange.shade900),
        iconTheme: IconThemeData(color: Colors.deepOrange.shade400),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(Colors.deepOrange.shade800))),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.deepOrange.shade800),
          ),
        ),
      ),
      title: "MyCloud",
      navigatorObservers: [routeObserver],
      routes: {
        AUTH: (context) => const Authorization(title: "Авторизация"),
        REGISTRATION: (context) => const Registration(title: "Регистрация"),
        '/': (context) => const Home(title: "Главная"),
        FILE: (context) => const Openfile(title: "Файл"),
        SEARCH_USERS: (context) =>
            const SearchUsers(title: "Поиск пользователей"),
        FILES_USERS: (context) => FilesUsers(
            title: "Файлы пользователей",
            args: ModalRoute.of(context)!.settings.arguments as ArgsFilesUsers),
        CHAT: (context) => ChatPage(
              title: "Чат",
              args: ModalRoute.of(context)!.settings.arguments as ChatArgument,
            ),
        CHAT_LIST: (context) => const ChatLists(title: "Чаты"),
        CHANGE_ACCOUNT: (context) =>
            const ChangeUser(title: "Сменить пользователя"),
      },
    );
  }
}

Future<ByteData> loadAsset(String path) async {
  return await rootBundle.load(path);
}

Future<ClientChannel> chan() async {
  final trustedRoots = await loadAsset("assets/cert/ca.crt");
  final trustedRootsbuffer = trustedRoots.buffer;

  return ClientChannel(
    ipServer,
    port: 50051,
    options: ChannelOptions(
        credentials: ChannelCredentials.secure(
      certificates: trustedRootsbuffer.asUint8List(
          trustedRoots.offsetInBytes, trustedRoots.lengthInBytes),
    )),
  );
}
