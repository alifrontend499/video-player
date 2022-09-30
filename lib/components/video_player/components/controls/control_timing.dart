import 'package:flutter/material.dart';

// package | video player
import 'package:video_player/video_player.dart';

// styles
const TextStyle textControlStyle = TextStyle(
  color: Colors.white,
  fontSize: 12
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

  // to convert time
  String getTime(val) {
    if(val < 10) {
      return "0$val";
    } else {
      return '$val';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12,
      left: 10,
      child: Row(
        children: [
          Text(
            "${getTime(widget.controller.value.position.inMinutes)}:${getTime(widget.controller.value.position.inSeconds)}",
            style: textControlStyle
          ),

          const SizedBox(width: 2),
          const Text(
              "/",
              style: textControlStyle
          ),
          const SizedBox(width: 2),

          Text(
            "${getTime(widget.controller.value.duration.inMinutes)}:${getTime(widget.controller.value.duration.inSeconds)}",
            style: textControlStyle
          ),
        ],
      ),
    );
  }
}
