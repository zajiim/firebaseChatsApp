import "package:flutter/material.dart";
import 'package:chat_app_riverpod/presentation/auth/login_screen.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/error_widget.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreenWidget(
            error: 'Page not found',
          ),
        ),
      );
  }
}
