import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/Repository/playlist_repository.dart';
import 'package:mark_player/Repository/playlist_video_repository.dart';
import 'package:mark_player/main.dart';
import 'package:mark_player/model/model.dart';

class PlaylistVideoController extends GetxController {
  final Box<IndividualPlaylistBox> playlistVideoObservableBox =
      PlaylistVideoRepository.getPlaylistVideoBox();

  List<String> moviepathlistCreator(String playlistName) {
    List<String> moviePathList = [];
    final individualBoxValues = playlistVideoObservableBox.values.toList();
    for (var i = 0; i < individualBoxValues.length; i++) {
      if (individualBoxValues[i].id == playlistName) {
        moviePathList.add(individualBoxValues[i].plAddedVideoPath);
      }
    }
    return moviePathList;
    update();
  }

  removeFromFav(String videoPath) {
    //boxPindvidual.values;
    final removeVideo = boxPindvidual.values
    //final removeVideo = boxPindvidual.values
        .firstWhere((element) => element.plAddedVideoPath == videoPath);
    removeVideo.delete();
    update();
  }
}
