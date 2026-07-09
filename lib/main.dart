import 'dart:async';

import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/app/multi_ioc_widget.dart';
import 'package:TalkSpace/app/notification/fcm_init.dart';
import 'package:TalkSpace/consts/domen.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/count_badge_view_model.dart';
import 'package:TalkSpace/presentation/viewmodels/user/common_token.dart';
import 'package:TalkSpace/services/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:grpc/grpc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

String? token;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await HiveBoxes.initHiveBoxes();
  var fcmInit = FcmInit();
  await fcmInit.setupFlutterNotifications();
  fcmInit.showFlutterNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveBoxes.initHiveBoxes();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MultiIocWidgetService(child: const MyApp()));
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
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((e) async {
      var notificationPermissionStatus = await Permission.notification.status;
      if (!notificationPermissionStatus.isDenied || !notificationPermissionStatus.isGranted) {
        await Permission.notification.request();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
