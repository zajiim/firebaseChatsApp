import 'package:chat_app_riverpod/application/user/user_controller.dart';
import 'package:chat_app_riverpod/firebase_options.dart';
import 'package:chat_app_riverpod/router.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:chat_app_riverpod/core/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/common/widgets/error_widget.dart';
import 'presentation/common/widgets/loader_widget.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/landing/landing_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: ChatApp(),
    ),
  );
}

class ChatApp extends ConsumerWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: kMainThemeColor2,
        ),
        scaffoldBackgroundColor: kWhite,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
          data: (user) {
            if (user == null) {
              return const LandingScreen();
            }
            return const HomeScreen();
          },
          error: ((error, stackTrace) => ErrorScreenWidget(
                error: error.toString(),
              )),
          loading: () {
            return const LoaderScreenWidget();
          }),
    );
  }
}
