// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

import '../../../core/message_enums.dart';
import 'video_player_item_widget.dart';

class DisplayMessage extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const DisplayMessage({
    Key? key,
    required this.message,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == MessageEnum.text
        ? Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : type == MessageEnum.video
            ? VideoPlayerItemWidget(
                videoUrl: message,
              )
            : CachedNetworkImage(
                imageUrl: message,
              );
  }
}
