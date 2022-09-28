import 'package:flutter/material.dart';

// global | colors
import 'package:app/utilities/globalColors.dart';

// package | video player
import 'package:video_player/video_player.dart';

// components
import 'package:app/components/video_player/components/video_overlay_component.dart';

class VideoPlayerComponent extends StatefulWidget {
  final VideoPlayerController controller;
  final Orientation orientation;

  const VideoPlayerComponent({
    Key? key,
    required this.controller,
    required this.orientation
  }) : super(key: key);

  @override
  State<VideoPlayerComponent> createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  @override
  Widget build(BuildContext context) {
    if(widget.controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: widget.controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            VideoPlayer(widget.controller), // main video player

            VideoPlayerOverlay(
              controller: widget.controller,
              orientation: widget.orientation
            ), // on screen overlay

            SizedBox( // video player progress indicator
              height: 10,
              child: VideoProgressIndicator(
                widget.controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  backgroundColor: Colors.white60,
                  playedColor: globalColorVideoTheme,
                  bufferedColor: Colors.grey
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 300,
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
