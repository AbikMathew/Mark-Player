import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class VideoDetailsBox extends HiveObject {
  VideoDetailsBox({required this.videoFilePath, required this.thumbnailPath, required this.fav});

  @HiveField(0)
  String videoFilePath;

  @HiveField(1)
  var thumbnailPath;

  @HiveField(2)
  bool fav;

}


@HiveType(typeId: 3)
class PlaylistBox{
  
  @HiveField(0)
  String playlistName;

  @HiveField(1)
  List<String> plVideoPath;

PlaylistBox({required this.playlistName, required this.plVideoPath});
}

@HiveType(typeId: 4)
class IndividualPlaylistBox {
  
  IndividualPlaylistBox({required this.id, required this.plAddedVideoPath, required this.plAddedThumbnail});

  @HiveField(0)
  String id;

  @HiveField(1)
  String plAddedVideoPath;

  @HiveField(2)
  var plAddedThumbnail;
}


// @HiveType(typeId: 2)
// class PlaylistNameBox {
//   @HiveField(0)
//   final String playListName;

//   PlaylistNameBox({required this.playListName});
// }