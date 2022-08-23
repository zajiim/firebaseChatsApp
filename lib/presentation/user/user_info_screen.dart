import "package:flutter/material.dart";

class UserInfoScreen extends StatelessWidget {
  static const String routeName = '/user-info-screen';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("User info SCreen"),
      ),
    );
  }
}
