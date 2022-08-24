import 'package:chat_app_riverpod/core/colors.dart';
import "package:flutter/material.dart";

class LoaderScreenWidget extends StatelessWidget {
  const LoaderScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        color: kMainThemeColor,
      ),
    );
  }
}
