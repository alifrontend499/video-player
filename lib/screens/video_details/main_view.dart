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
  final String videoUrl = 'https://player.vimeo.com/external/661255411.m3u8?s=ad5203d91b37ed920981cf4682384616dc7e23da';
  // final String videoUrl = 'https://cdn.videvo.net/videvo_files/video/premium/video0053/large_watermarked/900-2_900-5792_preview.mp4';

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
    controller.play();
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
              orientation: orientation,
              videoUrl: videoUrl
            );
          },
        ),
      ),
    );
  }
}
