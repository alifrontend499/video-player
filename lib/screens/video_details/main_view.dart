import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// package | video player
import 'package:video_player/video_player.dart';

// video player component
import 'package:app/components/video_player/index.dart';

class VideoDetailsScreen extends StatefulWidget {
  const VideoDetailsScreen({Key? key}) : super(key: key);

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  final String videoUrl = 'https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-large.mp4';
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // initializing the player
    controller = VideoPlayerController.network(videoUrl);
    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() {}));
    // controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

    setDefaultOrientation();
  }

  Future setDefaultOrientation() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return VideoPlayerComponent(
              controller: controller,
              orientation: orientation
            );
          },
        ),
      ),
    );
  }
}
