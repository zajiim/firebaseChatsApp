import "package:flutter/material.dart";
import 'package:chat_app_riverpod/core/colors.dart';

import 'presentation/home/home_screen.dart';

main() async {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      title: 'ChatApp',
      theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: kMainThemeColor2),
          scaffoldBackgroundColor: kMainThemeColor),
    );
  }
}
