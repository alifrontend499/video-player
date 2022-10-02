import 'dart:io';

import 'package:app/utilities/routing/routing_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// package | path provider
import 'package:path_provider/path_provider.dart';

class DownloadsListingScreen extends StatefulWidget {
  const DownloadsListingScreen({Key? key}) : super(key: key);

  @override
  State<DownloadsListingScreen> createState() => _DownloadsListingScreenState();
}

class _DownloadsListingScreenState extends State<DownloadsListingScreen> {

  late Future<List<dynamic>> userData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userData = getData();

    print('userData $userData');

  }


  Future<List<dynamic>> getData() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    Directory dir = Directory(appDocPath);
    List<FileSystemEntity> files = dir.listSync();

    List<dynamic> finalList = [];
    for(FileSystemEntity file in files) {
      final isDirectory = await FileSystemEntity.isDirectory(file.path);

      if(isDirectory == false) {
        finalList.add({
          'name': 'file Name',
          'path': file.path
        });
      }
    }

    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('All Videos'),
      ),

      body: FutureBuilder(
        future: userData,
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            final fileData = snapshot.data ?? [];
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: fileData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  highlightColor: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Text('Vide link $index'),
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    videosDetailsScreenRoute
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
        }
      )
    );
  }
}
