import 'package:flutter/material.dart';

// package | video player
import 'package:video_player/video_player.dart';

// controls
import 'package:app/components/video_player/components/control_play_pause.dart';
import 'package:app/components/video_player/components/control_fullscreen.dart';

class VideoPlayerOverlay extends StatefulWidget {
  final VideoPlayerController controller;
  final Orientation orientation;

  const VideoPlayerOverlay({
    Key? key,
    required this.controller,
    required this.orientation
  }) : super(key: key);

  @override
  State<VideoPlayerOverlay> createState() => _VideoPlayerOverlayState();
}

class _VideoPlayerOverlayState extends State<VideoPlayerOverlay> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black26,
        child: Stack(
          alignment: Alignment.center,
          children: [ // all options on the overlay
            ControlPlayPause(controller: widget.controller), // play pause

            ControlFullScreen(
              controller: widget.controller,
              orientation: widget.orientation
            ) // fullscreen
          ],
        ),
      ),
    );
  }
}
