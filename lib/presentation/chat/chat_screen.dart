import 'package:chat_app_riverpod/core/chat_data.dart';
import 'package:chat_app_riverpod/core/colors.dart';
import 'package:chat_app_riverpod/presentation/chat/widgets/chat_messages_list.dart';
import "package:flutter/material.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainThemeColor,
        title: Text(
          info[0]['name'].toString(),
        ),
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
                  color: kMainThemeColor2,
                ),
              ),
              color: kMainThemeColor,
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
    );
  }
}
