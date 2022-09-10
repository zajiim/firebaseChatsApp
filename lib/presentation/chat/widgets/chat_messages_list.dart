import 'package:chat_app_riverpod/application/chat/chat_controller.dart';

import 'package:chat_app_riverpod/domain/chat/models/message.dart';
import 'package:chat_app_riverpod/presentation/chat/widgets/my_message_card.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/loader_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'other_message_card.dart';

class ChatMessagesList extends ConsumerStatefulWidget {
  final String receiverUserId;
  const ChatMessagesList({required this.receiverUserId, Key? key})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatMessagesListState();
}

class _ChatMessagesListState extends ConsumerState<ChatMessagesList> {
  final ScrollController messageScrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    messageScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream: ref.read(chatControllerProvider).chatMessageStream(
              widget.receiverUserId,
            ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoaderScreenWidget();
          }
          SchedulerBinding.instance.addPostFrameCallback((_) {
            messageScrollController
                .jumpTo(messageScrollController.position.maxScrollExtent);
          });
          return ListView.builder(
            controller: messageScrollController,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final messageData = snapshot.data![index];
              String timeSent = DateFormat.Hm().format(messageData.timeSent);
              if (messageData.senderId ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(
                  date: timeSent,
                  message: messageData.text,
                );
              } else {
                return OtherMessageCard(
                  date: timeSent,
                  message: messageData.text,
                );
              }
            },
            itemCount: snapshot.data!.length,
          );
        });
  }
}
