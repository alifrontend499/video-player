import 'package:flutter/material.dart';

// package | video player
import 'package:video_player/video_player.dart';

// icons
import 'package:unicons/unicons.dart';

// styles
const TextStyle textControlStyle = TextStyle(
  color: Colors.white,
  fontSize: 14
);

class ControlTiming extends StatefulWidget {
  final VideoPlayerController controller;

  const ControlTiming({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  State<ControlTiming> createState() => _ControlTimingState();
}

class _ControlTimingState extends State<ControlTiming> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Row(
        children: [
          Text(
            "${widget.controller.value.duration.inSeconds}",
            style: textControlStyle
          ),

          const SizedBox(width: 2),
          const Text(
              "/",
              style: textControlStyle
          ),
          const SizedBox(width: 2),

          Text(
            "${widget.controller.value.duration.inSeconds}",
            style: textControlStyle
          ),
        ],
      ),
    );
  }
}
