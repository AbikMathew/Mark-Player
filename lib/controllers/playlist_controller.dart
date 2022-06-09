import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/Repository/playlist_repository.dart';
import 'package:mark_player/Repository/video_repository.dart';
import 'package:mark_player/model/model.dart';

class PlaylistController extends GetxController {
  final Box<PlaylistBox> playlistObservableBox =
      PlaylistRepository.getPlaylistBox();

  playlistClear(){
    PlaylistRepository.getPlaylistBox().clear();
  }
  
  addPlaylist({required PlaylistBox boxModel}) {
    playlistObservableBox.add(boxModel);
    update();
  }

  deletePlaylist({required int index}) {
    playlistObservableBox.deleteAt(index);
    Get.back();
    update();
  }
}
