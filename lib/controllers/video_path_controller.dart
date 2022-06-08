import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/Repository/video_repository.dart';
import 'package:mark_player/model/model.dart';

import '../function/searchFiles.dart';

class VideoPathController extends GetxController {
  final Box<VideoDetailsBox> mainObservableBox = VideoRepository.getVideoBox();
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

  folderListCreator() {
    List<String> repeatedFolderNames = [];
    List<String> folderNames = [];
    final _videoDetailsValues = mainObservableBox.values.toList();

    for (var i = 0; i < _videoDetailsValues.length; i++) {
      List<String> pathItemsList =
          _videoDetailsValues[i].videoFilePath.split('/').toList();
      repeatedFolderNames
          .add(pathItemsList.elementAt(pathItemsList.length - 2));
    }

    folderNames = repeatedFolderNames.toSet().toList();
    folderNames.remove('0');
    return folderNames;
  }
}
