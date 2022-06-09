import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/model/model.dart';

class PlaylistRepository {
  static Box<PlaylistBox> getPlaylistBox() => Hive.box<PlaylistBox>('MP_BoxP');
}