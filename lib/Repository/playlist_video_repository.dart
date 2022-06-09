import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/model/model.dart';

class PlaylistVideoRepository {
  static Box<IndividualPlaylistBox> getPlaylistVideoBox() => Hive.box<IndividualPlaylistBox>('MP_BoxP_indv');
}