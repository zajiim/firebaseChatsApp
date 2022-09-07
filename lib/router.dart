import 'package:chat_app_riverpod/presentation/auth/otp_screen.dart';
import 'package:chat_app_riverpod/presentation/chat/chat_screen.dart';
import 'package:chat_app_riverpod/presentation/select_contacts/select_contacts_screen.dart';
import 'package:chat_app_riverpod/presentation/user/user_info_screen.dart';
import "package:flutter/material.dart";
import 'package:chat_app_riverpod/presentation/auth/login_screen.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/error_widget.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInfoScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInfoScreen(),
      );

    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(),
      );

    case ChatScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChatScreen(),
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
