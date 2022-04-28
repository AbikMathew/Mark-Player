import 'package:flutter/material.dart';
import 'package:mark_player/main.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/Main Screens/InsidePlaylist.dart';
import '../screens/settings.dart';

class PlaylistTile extends StatelessWidget {
  PlaylistTile(
      {Key? key,
      required this.playlistName,
      required this.pListMoviePath,
      required this.index})
      : super(key: key);

  List<String> pListMoviePath;
  String playlistName;
  int index;
  //var thumbnailPic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        shape: Theme.of(context).listTileTheme.shape,
        tileColor: Theme.of(context).listTileTheme.tileColor,
        leading: Icon(Icons.playlist_play,
            //FaIcon(FontAwesomeIcons.folder,
            color: Theme.of(context).iconTheme.color),
        //
        title: Text(
          playlistName,
          style: TextStyle(color: Theme.of(context).listTileTheme.textColor),
        ),
      ),
    );
  }

  removePlaylist(String playlistName, BuildContext context) {
    //boxPindvidual.values;
    final removeVideo = boxP.values
        .firstWhere((element) => element.playlistName == playlistName);
    removeVideo.delete();
    Navigator.pop(context);
  }
}
