import 'package:chat_app_riverpod/firebase_options.dart';
import 'package:chat_app_riverpod/router.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:chat_app_riverpod/core/colors.dart';

import 'presentation/home/home_screen.dart';
import 'presentation/landing/landing_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: kMainThemeColor2),
          scaffoldBackgroundColor: kMainThemeColor),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LandingScreen(),
    );
  }
}
