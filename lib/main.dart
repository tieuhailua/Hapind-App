import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hapind/firebase_options.dart';
import 'package:hapind/routes.dart';
import 'package:hapind/screens/splash/splash_screen.dart';
import 'package:hapind/service/auth/auth_service.dart';
import 'package:hapind/service/chat/chat_service.dart';
import 'package:hapind/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ChatService().initNotification();
  //runApp( MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
   MyApp({Key? key}) : super(key: key) {
    _configureFirebaseMessaging();
  }
    void _configureFirebaseMessaging() {
    _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message: $message");

      // Hiển thị thông báo khi nhận được tin nhắn
      // (Bạn có thể sử dụng một thư viện thông báo như `flutter_local_notifications`)
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
