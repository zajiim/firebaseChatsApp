// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app_riverpod/application/chat/chat_controller.dart';

import '../../../core/colors.dart';

ValueNotifier<bool> isTyping = ValueNotifier(false);
final TextEditingController messageController = TextEditingController();

class BottomChatField extends ConsumerWidget {
  final String receiverUserId;
  const BottomChatField({
    Key? key,
    required this.receiverUserId,
    required this.dimensions,
  }) : super(key: key);

  final Size dimensions;

  // bool isTyping = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void sendTextMessage() async {
      if (isTyping.value) {
        ref.read(chatControllerProvider).sendTextMessage(
              context,
              messageController.text.trim(),
              receiverUserId,
            );
        messageController.text = '';
      }
    }

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 4,
              bottom: 5,
            ),
            child: Container(
              // height: widget.dimensions.height * 0.07,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kWhite,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions_outlined,
                      color: kGreyColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.gif_box_rounded,
                      color: kGreyColor,
                    ),
                  ),

                  Expanded(
                      child: TextFormField(
                    controller: messageController,
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        isTyping.value = true;
                      } else {
                        isTyping.value = false;
                      }
                      // if (val.isNotEmpty) {
                      //   setState(() {
                      //     isTyping = true;
                      //   });
                      // } else {
                      //   setState(() {
                      //     isTyping = false;
                      //   });
                      // }
                    },
                    decoration: InputDecoration(
                      fillColor: kWhite,
                      filled: true,
                      hintText: "Message",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                    ),
                  )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.attach_file,
                      color: kGreyColor,
                    ),
                  ),

                  //
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 3,
            left: 3,
            bottom: 5,
          ),
          child: CircleAvatar(
            backgroundColor: kMainThemeColor2,
            radius: 25,
            child: ValueListenableBuilder(
                valueListenable: isTyping,
                builder: (context, _, __) {
                  return GestureDetector(
                    onTap: sendTextMessage,
                    child: Icon(
                      (isTyping.value == true) ? Icons.send_rounded : Icons.mic,
                      color: kWhite,
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
