import 'package:chat_app_riverpod/core/chat_data.dart';
import 'package:chat_app_riverpod/presentation/chat/chat_screen.dart';
import "package:flutter/material.dart";

import '../../../core/colors.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
            },
            child: ListTile(
              title: Text(
                info[index]['name'].toString(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  info[index]['message'].toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(info[index]['profilePic'].toString()),
                radius: 25,
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text(
                  info[index]['time'].toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: kGreyColor,
                  ),
                ),
              ),
            ),
          );
        }),
        separatorBuilder: ((context, index) => const Divider(
              color: kWhite,
            )),
        itemCount: info.length,
      ),
    );
  }
}
