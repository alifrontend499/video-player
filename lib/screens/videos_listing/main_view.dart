import 'package:flutter/material.dart';

// routes
import 'package:app/utilities/routing/routing_constants.dart';

class VideosListingScreen extends StatefulWidget {
  const VideosListingScreen({Key? key}) : super(key: key);

  @override
  State<VideosListingScreen> createState() => _VideosListingScreenState();
}

class _VideosListingScreenState extends State<VideosListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('All Videos'),
      ),

      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: 15,
        itemBuilder: (context, index) {
          return InkWell(
            highlightColor: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text('Vide link $index'),
            ),
            onTap: () => Navigator.pushNamed(context, videosDetailsScreenRoute),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        // addRepaintBoundaries: false
      )
    );
  }
}
