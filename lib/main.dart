import 'dart:async';

import 'package:TalkSpace/app/bloc_providers.dart';
import 'package:TalkSpace/app/notification/fcm_init.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/cubit/count_bloc.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/data/repository/chat_grpc.dart';
import 'package:TalkSpace/observers/observer.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:grpc/grpc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveBoxes.initHiveBoxes();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(FcmInit().firebaseMessagingBackgroundHandler);
  Bloc.observer = const MyBlocObserver();

  runApp(MultiBlocProvider(providers: BlockProviders.blockProviders, child: const MyApp()));
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
  var access_token = HiveBoxes.token.get('access_token');

  void _token(String? token) {
    setState(() {
      access_token = token;
    });
  }

  StreamSubscription<StreamGetMessagesGeneralResponse>? stream;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((e) async {
      stream = await ChatGrpc().streamGetMessagesGeneral((e) {
        context.read<CountBloc>().add(SetCount(e.count));
      });
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
    _token(HiveBoxes.token.get('access_token'));
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

Future<ClientChannel> chan() async {
  final trustedRoots = await rootBundle.load("assets/cert/ca.crt");
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
