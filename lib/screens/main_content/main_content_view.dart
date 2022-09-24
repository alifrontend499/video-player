import 'package:flutter/material.dart';

// content screens
import 'package:app/screens/videos_listing/main_view.dart';

// icons
import 'package:unicons/unicons.dart';

class MainContentScreen extends StatefulWidget {
  const MainContentScreen({Key? key}) : super(key: key);

  @override
  State<MainContentScreen> createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  int currentIndex = 0;
  final List<Widget> screens= [
    const VideosListingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),

        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 3),
              child: Icon(
                (currentIndex == 1) ? UniconsLine.home : UniconsLine.home_alt,
                size: 22,
              ),
            ),
          ),

          const BottomNavigationBarItem(
            label: "Downloads",
            icon: Padding(
              padding: EdgeInsets.only(bottom: 5, top: 3),
              child: Icon(
                UniconsLine.map,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
