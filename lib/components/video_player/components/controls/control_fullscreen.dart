import 'package:flutter/material.dart';

// package | video player
import 'package:video_player/video_player.dart';
// package | auto orientation
import 'package:auto_orientation/auto_orientation.dart';

// icons
import 'package:unicons/unicons.dart';

class ControlFullScreen extends StatefulWidget {
  final VideoPlayerController controller;
  final Orientation orientation;

  const ControlFullScreen({
    Key? key,
    required this.controller,
    required this.orientation
  }) : super(key: key);

  @override
  State<ControlFullScreen> createState() => _ControlFullScreenState();
}

class _ControlFullScreenState extends State<ControlFullScreen> {

  void setLandscape(isPortrait) {
    if(isPortrait) {
      AutoOrientation.landscapeRightMode();
    } else {
      AutoOrientation.portraitUpMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = widget.orientation == Orientation.portrait;

    return Positioned(
      bottom: 5 + 10,
      right: 10,
      child: InkWell(
        onTap: () => setLandscape(isPortrait),
        child: const Icon(
          UniconsLine.expand_arrows,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
