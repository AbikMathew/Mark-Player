import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/Repository/video_repository.dart';
import 'package:mark_player/model/model.dart';

import '../function/searchFiles.dart';

class VideoPathController extends GetxController {
  final Box mainObservableBox = VideoRepository.getVideoBox();
  List<String> _pathList = [];

  clearBox() => mainObservableBox.clear();

  addToBox(int index, VideoDetailsBox boxModel) {
    mainObservableBox.put(index, boxModel);
    update();
  }

  getFiles() async {
    List<String> values = ['mp4', 'mov', 'mkv'];
    await SearchFilesInStorage.searchInStorage(
      values,
      (List<String> data) {
        _pathList.clear();
        _pathList.addAll(data);
        // addPathOnlytoDB();
        addToObservableBox();
      },
      (error) {},
    ); //TODO: implement initState
  }

  addToObservableBox() {
    for (var i = 0; i < _pathList.length; i++) {
      //
      addToBox(
        i,
        VideoDetailsBox(
            videoFilePath: _pathList[i], thumbnailPath: null, fav: false),
      );
    }
  }
}
