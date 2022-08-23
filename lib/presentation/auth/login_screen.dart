import 'package:chat_app_riverpod/core/colors.dart';
import 'package:chat_app_riverpod/core/constants.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/common_button.dart';
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Enter your phone number"),
        elevation: 0,
        backgroundColor: kMainThemeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Messenger will need to verify your phone number",
            ),
            k10Height,
            TextButton(
              onPressed: () {},
              child: const Text(
                "Pick country",
              ),
            ),
            k5Height,
            Row(
              children: [
                Text('+91'),
                k10Width,
                SizedBox(
                  width: dimension.width * 0.7,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      hintText: "Enter your phone number",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: dimension.height * 0.6,
            ),
            SizedBox(
              width: 90,
              child: CommonButton(text: "Next", onPressed: () {},),
            )
          ],
        ),
      ),
    );
  }
}
