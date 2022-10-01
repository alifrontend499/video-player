import 'dart:io';

import 'package:flutter/material.dart';

// package | path provider
import 'package:path_provider/path_provider.dart';

// package | video player
import 'package:video_player/video_player.dart';

// package | uuid
import 'package:uuid/uuid.dart';

// package | dio
import 'package:dio/dio.dart';


// icons
import 'package:unicons/unicons.dart';

// styles
const TextStyle textControlStyle = TextStyle(
  color: Colors.white,
  fontSize: 14
);

class ControlDownload extends StatefulWidget {
  final VideoPlayerController controller;
  final String videoUrl;

  const ControlDownload({
    Key? key,
    required this.controller,
    required this.videoUrl
  }) : super(key: key);

  @override
  State<ControlDownload> createState() => _ControlDownloadState();
}

class _ControlDownloadState extends State<ControlDownload> {

  double progress = 0;

  void downloadVideo() async {
    print('onReceiveProgress clicked');
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      const uuid = Uuid();
      final String path = '$appDocPath/${uuid.v4()}_video_file';

      final response = await Dio().download(
        widget.videoUrl,
        path,
        onReceiveProgress: (receiveBytes, totalBytes) {
          print('onReceiveProgress receiveBytes $receiveBytes');
          print('onReceiveProgress totalBytes $totalBytes');

          setState(() {
            progress = receiveBytes / totalBytes;
          });

        }
      );

      print('onReceiveProgress here file $path');
      print('onReceiveProgress here $response');

    } catch(err) {
      print('onReceiveProgress error while getting the path $err');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10 + 35,
      child: InkWell(
        onTap: downloadVideo,
        child: Row(
          children: [
            const Icon(
              UniconsLine.import_icon,
              color: Colors.white,
              size: 19,
            ),
            SizedBox(width: 5),

            Text('prog: $progress%', style: TextStyle(color: Colors.white),)
          ],
        ),
      )
    );
  }
}
