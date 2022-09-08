// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app_riverpod/application/user/user_controller.dart';
import 'package:chat_app_riverpod/domain/user/models/user.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/loader_widget.dart';
import "package:flutter/material.dart";

import 'package:chat_app_riverpod/core/chat_data.dart';
import 'package:chat_app_riverpod/core/colors.dart';
import 'package:chat_app_riverpod/presentation/chat/widgets/chat_messages_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  const ChatScreen({
    Key? key,
    required this.name,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimensions = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backgroundImageLight.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: kMainThemeColor2,
          title: StreamBuilder<UserModel>(
              stream: ref.read(userControllerProvider).userDataById(uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoaderScreenWidget();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(
                      snapshot.data!.isOnline ? 'online' : '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                );
              }),
          // leading: CircleAvatar(
          //   radius: 20,
          //   backgroundImage: NetworkImage(
          //     info[0]['profilePic'].toString(),
          //   ),
          // ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Column(
          children: [
            const Expanded(
              child: ChatMessagesList(),
            ),

            // TextField(
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: kMainThemeColor,
            //     prefixIcon: const Padding(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: 20,
            //       ),
            //       child: Icon(
            //         Icons.emoji_emotions,
            //         color: kGreyColor,
            //       ),
            //     ),
            //     suffixIcon: Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 20,
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: const [
            //           Icon(
            //             Icons.attach_file,
            //             color: kGreyColor,
            //           ),
            //           Icon(
            //             Icons.currency_rupee_rounded,
            //             color: kGreyColor,
            //           ),
            //           Icon(
            //             Icons.camera_alt,
            //             color: kGreyColor,
            //           ),
            //         ],
            //       ),
            //     ),
            //     hintText: "Message",
            //     hintStyle: TextStyle(color: kGreyColor),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //       borderSide: const BorderSide(
            //         width: 0,
            //         style: BorderStyle.none,
            //       ),
            //     ),
            //     contentPadding: const EdgeInsets.all(10),
            //   ),
            // ),
            Container(
              height: dimensions.height * 0.07,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kMainThemeColor,
                  ),
                ),
                color: kWhite,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions_outlined,
                      color: kGreyColor,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: kGreyColor,
                        filled: true,
                        hintText: "Message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.attach_file_outlined,
                      color: kGreyColor,
                    ),
                  ),
                  //
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
