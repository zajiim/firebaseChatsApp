// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app_riverpod/core/colors.dart';
import "package:flutter/material.dart";
import 'package:cached_video_player/cached_video_player.dart';

class VideoPlayerItemWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerItemWidget({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<VideoPlayerItemWidget> createState() => _VideoPlayerItemWidgetState();
}

class _VideoPlayerItemWidgetState extends State<VideoPlayerItemWidget> {
  late CachedVideoPlayerController videoPlayerController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    videoPlayerController = CachedVideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.setVolume(1);
      });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          CachedVideoPlayer(videoPlayerController),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              iconSize: 35,
              onPressed: () {
                if (isPlaying) {
                  videoPlayerController.pause();
                } else {
                  videoPlayerController.play();
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
              icon: Icon(
                isPlaying ? Icons.pause_circle : Icons.play_circle,
                color: kGreyColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
