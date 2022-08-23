import "package:flutter/material.dart";

class ErrorScreenWidget extends StatelessWidget {
  final String error;
  const ErrorScreenWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
