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

class ControlDownload extends StatefulWidget {
  final VideoPlayerController controller;

  const ControlDownload({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  State<ControlDownload> createState() => _ControlDownloadState();
}

class _ControlDownloadState extends State<ControlDownload> {
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 10,
      right: 10 + 35,
      child: Icon(
        UniconsLine.import_icon,
        color: Colors.white,
        size: 19,
      )
    );
  }
}
