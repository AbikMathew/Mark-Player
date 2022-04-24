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
