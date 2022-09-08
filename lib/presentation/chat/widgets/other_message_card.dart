import "package:flutter/material.dart";
import 'package:chat_app_riverpod/core/colors.dart';

class OtherMessageCard extends StatelessWidget {
  final String message;
  final String date;
  const OtherMessageCard({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dimensions.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          color: kWhite,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 30,
                  bottom: 20,
                  left: 10,
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Positioned(
                  bottom: 2,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: kGreyColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.done_all,
                        color: kBlueColor,
                        size: 18,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
