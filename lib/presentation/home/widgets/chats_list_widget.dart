import 'package:chat_app_riverpod/application/chat/chat_controller.dart';
import 'package:chat_app_riverpod/core/chat_data.dart';
import 'package:chat_app_riverpod/domain/chat/models/chat_contact.dart';
import 'package:chat_app_riverpod/presentation/chat/chat_screen.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/loader_widget.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/colors.dart';

class ChatListWidget extends ConsumerWidget {
  const ChatListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: StreamBuilder<List<ChatContact>>(
          stream: ref.watch(chatControllerProvider).chatContacts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoaderScreenWidget();
            }
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                var chatContactData = snapshot.data![index];

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ChatScreen.routeName,
                        arguments: {
                          'name': chatContactData.name,
                          'uid': chatContactData.contactId,
                        });
                  },
                  child: ListTile(
                    title: Text(
                      chatContactData.name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        chatContactData.lastMessage,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        chatContactData.profilePic,
                      ),
                      radius: 25,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Text(
                        DateFormat.Hm().format(chatContactData.timeSent),
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
              itemCount: snapshot.data!.length,
            );
          }),
    );
  }
}
