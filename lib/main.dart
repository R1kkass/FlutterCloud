import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/cubit/count_bloc.dart';
import 'package:TalkSpace/cubit/current_page_bloc.dart';
import 'package:TalkSpace/cubit/download_file_bloc.dart';
import 'package:TalkSpace/cubit/folder_cubit.dart';
import 'package:TalkSpace/cubit/registration_bloc.dart';
import 'package:TalkSpace/cubit/space_cubit.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/cubit/upload_file_bloc.dart';
import 'package:TalkSpace/grpc/chat_grpc.dart';
import 'package:TalkSpace/observers/observer.dart';
import 'package:TalkSpace/proto/chat/chat.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:permission_handler/permission_handler.dart';

ClientChannel channel = ClientChannel(
  ipServer,
  port: 50051,
  options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
);

String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  channel = await chan();

  await Hive.initFlutter();
  await Hive.openBox('token');
  await Hive.openBox('list_token');
  await Hive.openBox('pubkey');
  await Hive.openBox<String>('secretkey');
  await Hive.openBox<String>('chatFileUploaded');

  Bloc.observer = const MyBlocObserver();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => FolderCubit(),
    ),
    BlocProvider(
      create: (context) => ContentBloc(
          state: ContentState(
              files: [],
              folders: [],
              error: false,
              uploadFile: {},
              search: "")),
    ),
    BlocProvider(
      create: (context) =>
          DownloadFileBloc(state: DownloadFileState(downloadFile: {})),
    ),
    BlocProvider(
      create: (context) =>
          UploadFileBloc(state: UploadFileState(chatUploadFiles: {})),
    ),
    BlocProvider(
      create: (context) => CountBloc(state: CountState(count: 0)),
    ),
    BlocProvider(
      create: (context) => RegistrationBloc(
          state: RegistrationState(email: "", password: "", secretKey: "")),
    ),
    BlocProvider(
      create: (context) => CurrentPageBloc(state: CurrentPageState(page: 0)),
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

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class _MyAppState extends State<MyApp> {
  var access_token = Hive.box('token').get('access_token');

  void _token(String? token) {
    setState(() {
      access_token = token;
    });
  }

  ResponseStream<StreamGetMessagesGeneralResponse>? stream;
  @override
  void initState() {
    super.initState();
    stream = ChatGrpc().streamGetMessagesGeneral();
    stream?.listen((e) {
      context.read<CountBloc>().add(SetCount(e.count));
    });
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      var permissionStatus = await Permission.storage.status;
      if (!permissionStatus.isGranted) {
        await Permission.storage.request();
      }

      if (!await Permission.photos.status.isGranted) {
        await Permission.photos.request();
      }

      if (!await Permission.videos.status.isGranted) {
        await Permission.videos.request();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    stream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String? token = context.read<TokenCubit>().state;
    if (token?.length == 0) {
      context.read<TokenCubit>().updateToken(access_token);
    }
    _token(Hive.box('token').get('access_token'));
    return MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
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
              foregroundColor:
                  WidgetStatePropertyAll(Colors.deepOrange.shade800),
            ),
          ),
        ),
        title: "MyCloud",
        navigatorObservers: [
          routeObserver,
          HeroController(),
        ],
        routes: AppRouter.routes);
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
      certificates: trustedRootsbuffer
          .asUint8List(trustedRoots.offsetInBytes, trustedRoots.lengthInBytes)
          .map((uint8) => uint8.toInt())
          .toList(),
    )),
  );
}
