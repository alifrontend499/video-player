import 'package:flutter/material.dart';

// -- routing
import 'package:app/utilities/routing/routing.dart' as router;
import 'package:app/utilities/routing/routing_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Video Player',
      onGenerateRoute: router.generatedRoutes,
      initialRoute: mainContentScreenRoute
    );
  }
}

