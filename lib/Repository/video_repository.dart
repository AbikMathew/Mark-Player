import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/model/model.dart';

class VideoRepository {
  static Box<VideoDetailsBox> getVideoBox() => Hive.box<VideoDetailsBox>('MP_Box');
}