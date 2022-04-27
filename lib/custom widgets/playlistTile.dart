import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/settings.dart';

class PlaylistTile extends StatelessWidget {
   PlaylistTile({Key? key, required this.playlistName, required this.pListMoviePath}) : super(key: key);
  
  List<String> pListMoviePath;
  String playlistName;
  //var thumbnailPic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        // onTap: () => Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => settingsPage())),
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
}
