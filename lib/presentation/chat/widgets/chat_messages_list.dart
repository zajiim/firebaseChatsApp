import 'package:chat_app_riverpod/core/chat_data.dart';
import 'package:chat_app_riverpod/presentation/chat/widgets/my_message_card.dart';
import "package:flutter/material.dart";

import 'other_message_card.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (messages[index]['isMe'] == true) {
          return MyMessageCard(
            date: messages[index]['time'].toString(),
            message: messages[index]['text'].toString(),
          );
        } else {
          return OtherMessageCard(
            date: messages[index]['time'].toString(),
            message: messages[index]['text'].toString(),
          );
        }
      },
      itemCount: messages.length,
    );
  }
}
