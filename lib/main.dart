import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/consts/domen.dart';
import 'package:flutter_application_2/cubit/content_bloc.dart';
import 'package:flutter_application_2/cubit/count_bloc.dart';
import 'package:flutter_application_2/cubit/current_page_bloc.dart';
import 'package:flutter_application_2/cubit/download_file_bloc.dart';
import 'package:flutter_application_2/cubit/folder_cubit.dart';
import 'package:flutter_application_2/cubit/space_cubit.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/observers/observer.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

ClientChannel channel = ClientChannel(
  ipServer,
  port: 50051,
  options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
);

String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // channel = await chan();

  await Hive.initFlutter();
  await Hive.openBox('token');
  await Hive.openBox('list_token');
  await Hive.openBox('pubkey');
  await Hive.openBox('secretkey');
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
      create: (context) => CountBloc(state: CountState(count: 0)),
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
        navigatorObservers: [routeObserver],
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
      certificates: trustedRootsbuffer.asUint8List(
          trustedRoots.offsetInBytes, trustedRoots.lengthInBytes),
    )),
  );
}
