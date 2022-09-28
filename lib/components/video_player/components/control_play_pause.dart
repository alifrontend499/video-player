import 'package:flutter/material.dart';

// package | video player
import 'package:video_player/video_player.dart';

// icons
import 'package:unicons/unicons.dart';

class ControlPlayPause extends StatefulWidget {
  final VideoPlayerController controller;

  const ControlPlayPause({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  State<ControlPlayPause> createState() => _ControlPlayPauseState();
}

class _ControlPlayPauseState extends State<ControlPlayPause> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: InkWell(
        onTap: () => widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play(),
        child: widget.controller.value.isPlaying
            ? const Icon(
          UniconsLine.play,
          color: Colors.white,
          size: 40,
        )
            : const Icon(
          UniconsLine.pause,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
