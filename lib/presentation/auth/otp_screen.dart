import 'package:chat_app_riverpod/application/auth/controller/auth_controller.dart';
import 'package:chat_app_riverpod/core/colors.dart';
import 'package:chat_app_riverpod/core/constants.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;
  const OTPScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  void verifyOTP(BuildContext context, WidgetRef ref, String otp) {
    ref.read(authControllerProvider).verifyOTP(
          context,
          verificationId,
          otp,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainThemeColor2,
        elevation: 0,
        title: const Text(
          "Verifying your OTP",
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            k20Height,
            const Text(
              "We have sent an SMS with a code.",
            ),
            SizedBox(
              width: dimension.width * 0.5,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "- - - - - -",
                  hintStyle: TextStyle(
                    fontSize: 35,
                  ),
                ),
                onChanged: (val) {
                  if (val.length == 6) {
                    verifyOTP(
                      context,
                      ref,
                      val.trim(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
