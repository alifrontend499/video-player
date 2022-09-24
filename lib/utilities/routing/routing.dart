import 'package:flutter/material.dart';

// -- all routes consts
import 'package:app/utilities/routing/routing_constants.dart';

// -- screens | all
import 'package:app/screens/main_content/main_content_view.dart';
import 'package:app/screens/videos_listing/main_view.dart';
import 'package:app/screens/video_details/main_view.dart';

Route<dynamic> generatedRoutes(RouteSettings settings) {
  switch(settings.name) {
    case videosListingScreenRoute:
      return MaterialPageRoute(builder: (context) => const VideosListingScreen());

    case videosDetailsScreenRoute:
      return MaterialPageRoute(builder: (context) => const VideoDetailsScreen());

    case mainContentScreenRoute:
      return MaterialPageRoute(builder: (context) => const MainContentScreen());

    default:
      return MaterialPageRoute(builder: (context) => const MainContentScreen());
  }
}