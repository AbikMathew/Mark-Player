import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mark_player/controllers/playlist_video_controller.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/playlistVideoTile.dart';
import 'package:mark_player/main.dart';
import 'package:mark_player/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InnerPlaylist extends StatefulWidget {
  InnerPlaylist(
      {Key? key,
      required this.plName,
      required this.plMoviePath,
      required this.index})
      : super(key: key);

  String plName;
  List<String> plMoviePath;
  int index;

  @override
  State<InnerPlaylist> createState() => _InnerPlaylistState();
}

class _InnerPlaylistState extends State<InnerPlaylist> {
  PlaylistVideoController controller = Get.put(PlaylistVideoController());
  @override
  Widget build(BuildContext context) {
    List<PlaylistBox> playlist = boxP.values.toList();

    // List<IndividualPlaylistBox> individualBoxValues = boxPindvidual.values.toList();

    // List<String> moviePathList = moviepathlistCreator(individualBoxValues);
    // List<Uint8List> thumbPathList = thumbpathlistCreator(individualBoxValues);

    return Scaffold(
      appBar: appBar(title: widget.plName, visible: false),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<PlaylistVideoController>(
              builder: (controller) {
                // List<IndividualPlaylistBox> _individualBoxValues = value.values.toList();

                List<String> moviePathList =
                    controller.moviepathlistCreator(widget.plName);
                //
                //   List thumbPathList = thumbpathlistCreator(_individualBoxValues);

                return ListView.builder(
                  itemCount: moviePathList.length,
                  itemBuilder: ((context, index) {
                    return PlaylistVideoTile(
                        moviePath: moviePathList[index],
                        //    thumbnailPhoto: thumbPathList[index],
                        index: index);
                  }),
                );
              },
            ),
            //  value listenalble builder ),
          )
        ],
      ),
    );
  }

  // List<String> moviepathlistCreator( List<IndividualPlaylistBox> individualBoxValues) {

  //   List<String> moviePathList = [];

  //   for (var i = 0; i < individualBoxValues.length; i++) {
  //     if (individualBoxValues[i].id == widget.plName) {
  //       moviePathList.add(individualBoxValues[i].plAddedVideoPath);

  //       // individualBoxValues[i].key;
  //       // individualBoxValues[i].key;
  //     }
  //   }
  //   return moviePathList;
  // }

  List<Uint8List> thumbpathlistCreator(
      List<IndividualPlaylistBox> individualBoxValues) {
    List<Uint8List> thumbPathList = [];
    for (var i = 0; i < individualBoxValues.length; i++) {
      if (individualBoxValues[i].id == widget.plName) {
        thumbPathList.add(individualBoxValues[i].plAddedThumbnail);
      }
    }
    return thumbPathList;
  }
}

// checkPlaylist(String name, List<String> moviePathList) async {
//  final playlistIndex = boxP.values.firstWhere(
//    (element) => element.playlistName == name);

//   //  print("ith kittitondo nn para mwone ${playlistIndex.plVideoPath.toList().toString()}");
//   //  print("ith kittitondo nn para mwone ${playlistIndex.playlistName.toString()}");
//    moviePathList = playlistIndex.plVideoPath.toList();

//   //  print('\n\nApo ithooo $moviePathList');
//   //  playlistToAdd.plVideoPath.add(widget.pathList[widget.index]);
//   //  print('aaaaaaaaaaaa');
//   //  var tab = boxP.values.toList();
//   //  print(playlistToAdd.plVideoPath.toList().toString());
//   //  print('aaaaaaaaaaaa1');
// }
