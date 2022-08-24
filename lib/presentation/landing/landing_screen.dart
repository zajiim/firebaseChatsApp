import 'package:chat_app_riverpod/core/colors.dart';
import 'package:chat_app_riverpod/core/constants.dart';
import 'package:chat_app_riverpod/presentation/auth/login_screen.dart';
import "package:flutter/material.dart";

import '../common/widgets/common_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  void navigateToLoginScreen(context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size;
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Welcome to Messenger',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: dimensions.height / 9,
            ),
            Image.asset(
              "assets/images/messengerBG.png",
              height: 340,
              width: 340,
            ),
            SizedBox(
              height: dimensions.height / 9,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Read our Privacy Policy. Tap \"Agree and continue\" to accept the Terms of Service",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ),
            k10Height,
            SizedBox(
              width: dimensions.width * 0.75,
              child: CommonButton(
                text: "AGREE AND CONTINUE",
                onPressed: () {
                  return navigateToLoginScreen(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
