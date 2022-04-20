import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:path/path.dart';

class VideoScreens extends StatelessWidget {
  VideoScreens({ Key? key, required this.videoFilePath }) : super(key: key);

  String videoFilePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(title: (basenameWithoutExtension(videoFilePath))),
      body: Center(
        child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.file(videoFilePath),
        // child: BetterPlayer.network(
        //   "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
        //   betterPlayerConfiguration: BetterPlayerConfiguration(
        //     aspectRatio: 16 / 9,
        //   ),
        // ),
      ),
      ),
    );
  }
}