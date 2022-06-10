import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mark_player/controllers/favourites_controller.dart';
import 'package:mark_player/controllers/playlist_video_controller.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mark_player/custom%20widgets/drop_down.dart';
// import 'package:mark_player/custom%20widgets/playlistTile.dart';
// import 'package:mark_player/main.dart';
// import 'package:mark_player/model/model.dart';
//import 'package:mark_player/screens/movies_page.dart';
import 'package:mark_player/screens/video_screens.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';

class PlaylistVideoTile extends StatefulWidget {
  PlaylistVideoTile(
      {Key? key,
      required this.moviePath,
      //   required this.thumbnailPhoto,
      required this.index})
      : super(key: key);

  String moviePath;
  //Uint8List thumbnailPhoto;
  int index;
  final FavoritesController favController = Get.find<FavoritesController>();
  //
  @override
  State<PlaylistVideoTile> createState() => _PlaylistVideoTileState();
}

class _PlaylistVideoTileState extends State<PlaylistVideoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        onLongPress: () {},
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoScreens(
                        videoFilePath: widget.moviePath,
                      )));
        },
        shape: Theme.of(context).listTileTheme.shape,
        tileColor: Theme.of(context).listTileTheme.tileColor,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(6.0),
              image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('asset/unsplash1.jpg')),
              //
            ),
          ),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                onTap: () {
                  widget.favController.addToFav(widget.moviePath);
                },
                child: const DropDown(
                    dropDownIcon: Icons.favorite,
                    dropDownItem: 'Add to favourites'),
              ),
              PopupMenuItem(
                child: const DropDown(
                    dropDownIcon: Icons.remove_circle,
                    dropDownItem: 'Remove from playlist'),
                onTap: () {
                  ctr.removeFromPlaylist(widget.moviePath);
                },
              ),
              PopupMenuItem(
                  onTap: () async {
                    await Share.shareFiles([widget.moviePath]);
                  },
                  child: const DropDown(
                      dropDownIcon: Icons.share, dropDownItem: 'Share'))
            ];
          },
          icon: Icon(Icons.more_vert,
              color: Theme.of(context).listTileTheme.textColor),
        ),
        subtitle: const Text(''),
        title: Text(
          basenameWithoutExtension(widget.moviePath),
          style: TextStyle(color: Theme.of(context).listTileTheme.textColor),
        ),
      ),
    );
  }

  PlaylistVideoController ctr = Get.find<PlaylistVideoController>();
  removeFromFav(String videoPath) {
    //boxPindvidual.values;
    final removeVideo = ctr.playlistVideoObservableBox.values
        //final removeVideo = boxPindvidual.values
        .firstWhere((element) => element.plAddedVideoPath == videoPath);
    removeVideo.delete();
  }
}

  // Future showSimpleDialog(BuildContext context) => showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //         contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
  //         titleTextStyle: TextStyle(
  //             color: Color(0xFFD6B392),
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16),
  //         backgroundColor: Color(0xFF212938),
  //         title: Text('Choose Playlist'),
  //         content: ValueListenableBuilder(
  //           valueListenable: boxP.listenable(),
  //           builder: (context, Box<PlaylistBox> value, child) {
  //             List<PlaylistBox> _playListValues = value.values.toList();
  //             // print("vannoooooooodaa");              
  //             // print(_playListValues[1].playlistName);
  //             return ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: _playListValues.length,
  //                 itemBuilder: (context, index) {
  //                   return _playListValues.isEmpty
  //                             ? const Center(
  //                                 child: Text('data'),
  //                               ): InkWell( onTap:(){ addToPlaylist(_playListValues[index].playlistName);
  //                                 //  _playListNames[index].playList.add(widget.pathList[widget.index]);
  //                             //    print('path ${widget.pathList[widget.index]} Addeddd to ${_playListValues[index].plVideoPath.toString()}');
  //                                 Navigator.of(context).pop();},
  //                                 child: PlaylistTile(playlistName: _playListValues[index].playlistName, pListMoviePath: []),
                                  
  //                                 );
  //                   //  return PlaylistTile(playlistName: '',);
  //                 });

  //             // return _playListValues.isEmpty?const Center(
  //             //                     child: Text('data'),
  //             //                   ):InkWell(
  //             //                   onTap: () {

  //             //                   },);
  //           },
  //         )));



  // void addToPlaylist(String playlistName){
  //   boxPindvidual.add(IndividualPlaylistBox(id: playlistName, plAddedVideoPath: widget.movieNamesList[widget.index], plAddedThumbnail: widget.thumbnailPhoto));
  //   print('Boxp Individualil അഡ് ആയോ ');
  //   var key = boxPindvidual.values.toList();
  //   for (var i = 0; i < boxPindvidual.length; i++) {
  //     var a = key[i].id;
  //     var b = key[i].plAddedVideoPath;
  //     print('പേരും പാത്തും കാണാവോ $a,$b');
  //   }
  // }


  // // void addToPlaylist(String name) async {
  // //  final playlistToAdd = boxP.values.firstWhere(
  // //    (element) => element.playlistName == name);
  // //    playlistToAdd.plVideoPath.add(widget.pathList[widget.index]);
  // //    print('aaaaaaaaaaaa');
  // //    var tab = boxP.values.toList();
     
  // //    for (var i = 0; i < tab.length; i++) {
  // //      print('\n\n\n\n\n\n madth bro ${tab[i].plVideoPath.toList().toString()}');
  // //    }
  // //   //  print(playlistToAdd.plVideoPath.toList().toString());
  // //    print('aaaaaaaaaaaa1');
  // }







