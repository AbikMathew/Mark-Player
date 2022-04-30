import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mark_player/custom%20widgets/drop_down.dart';
import 'package:mark_player/custom%20widgets/playlistTile.dart';
import 'package:mark_player/main.dart';
import 'package:mark_player/model/model.dart';
//import 'package:mark_player/screens/movies_page.dart';
import 'package:mark_player/screens/video_screens.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';

class MovieTile extends StatefulWidget {
  MovieTile(
      {Key? key,
      //    required this.pathList,
      required this.movieNamesList,
      required this.index,
      required this.moviesTitle,
      required this.thumbnailPhoto})
      : super(key: key);

  // final List<String> folderNames;
  int index;
  List<String> movieNamesList;

  // List<String> pathList;
  String moviesTitle;

  var thumbnailPhoto;

  @override
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  List thumbList = [];
  String playlistNameToHive = '';
  Box<PlaylistBox> boxP1 = Hive.box<PlaylistBox>('MP_BoxP');

  List<VideoDetailsBox> videoValues =
      Hive.box<VideoDetailsBox>('MP_Box').values.toList();
  thumbnailMaker() {
    for (var i = 0; i < videoValues.length; i++) {
      thumbList.add(videoValues[i].thumbnailPath);
    }
  }

  //var boxPlaylist = Hive.box<PlayList>(playlistBox);
  @override
  Widget build(BuildContext context) {
    thumbnailMaker();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        //  visualDensity: const VisualDensity(vertical: 1),
        onLongPress: () {},
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoScreens(
                        videoFilePath: widget.movieNamesList[widget.index],
                      )));
        },

        shape: Theme.of(context).listTileTheme.shape,
        tileColor: Theme.of(context).listTileTheme.tileColor,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          //  child: Image.file(File(widget.getThumbnail(widget.movieNamesList[widget.index]))),

          //  child: Image.memory(thumbnailList[widget.index])),

          child: Container(
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: widget.thumbnailPhoto == null
                    ? const AssetImage('asset/unsplash1.jpg') as ImageProvider
                    : MemoryImage(widget.thumbnailPhoto),
                // image: MemoryImage(widget.thumbnailPhoto),
                //image: MemoryImage(thumbList[widget.index]),
              ),
              //
            ),
          ),
        ),

        // FaIcon(FontAwesomeIcons.folder,
        //     color: Theme.of(context).iconTheme.color),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              // PopupMenuItem(
              //   child: DropDown(
              //       dropDownIcon: Icons.favorite,
              //       dropDownItem: 'Add to favourites'),
              // ),
              PopupMenuItem(
                  onTap: () {
                    Future.delayed(const Duration(seconds: 0),
                        () => showSimpleDialog(context));
                  },
                  child: const DropDown(
                      dropDownIcon: Icons.playlist_add,
                      dropDownItem: 'Add to playlist')),
              PopupMenuItem(
                  onTap: () async {
                    await Share.shareFiles(
                        [widget.movieNamesList[widget.index]]);
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
          basenameWithoutExtension(widget.movieNamesList[widget.index]),
          style: TextStyle(color: Theme.of(context).listTileTheme.textColor),
        ),
      ),
    );
  }

  Future showSimpleDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          shape: Theme.of(context).popupMenuTheme.shape,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          titleTextStyle: const TextStyle(
              color: Color(0xFFD6B392),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          backgroundColor: const Color(0xFF212938),
          title: const Text('Choose Playlist'),
          actions: [
            TextButton(
                onPressed: () => openDialog(context),
                child: const Text(
                  'Create playlist',
                  style: TextStyle(color: Color(0xFFD6B392)),
                ))
          ],
          content: ValueListenableBuilder(
            valueListenable: boxP.listenable(),
            builder: (context, Box<PlaylistBox> value, child) {
              List<PlaylistBox> _playListValues = value.values.toList();
              // print("vannoooooooodaa");
              // print(_playListValues[1].playlistName);
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _playListValues.length,
                  itemBuilder: (context, index) {
                    return check(_playListValues, context, index);
                    // return _playListValues.isEmpty
                    //           ? const Center(
                    //               child: Text('data', style: TextStyle(color: Colors.white),),
                    //             ): InkWell( onTap:(){ addToPlaylist(_playListValues[index].playlistName);
                    //               //  _playListNames[index].playList.add(widget.pathList[widget.index]);
                    //           //    print('path ${widget.pathList[widget.index]} Addeddd to ${_playListValues[index].plVideoPath.toString()}');
                    //               Navigator.of(context).pop();},
                    //               child: PlaylistTile(playlistName: _playListValues[index].playlistName, pListMoviePath: [], index: index,),

                    //               );
                    //  return PlaylistTile(playlistName: '',);
                  });

              // return _playListValues.isEmpty?const Center(
              //                     child: Text('data'),
              //                   ):InkWell(
              //                   onTap: () {

              //                   },);
            },
          )));

  void addToPlaylist(String playlistName) {
    boxPindvidual.add(IndividualPlaylistBox(
        id: playlistName,
        plAddedVideoPath: widget.movieNamesList[widget.index],
        plAddedThumbnail: widget.thumbnailPhoto));
    print('Boxp Individualil അഡ് ആയോ ');
    // var key = boxPindvidual.values.toList();
    // for (var i = 0; i < boxPindvidual.length; i++) {
    //   var a = key[i].id;
    //   var b = key[i].plAddedVideoPath;
    //   print('പേരും പാത്തും കാണാവോ $a,$b');
    // }
  }

  Widget check(List _playListValues, BuildContext context, int index) {
    if (_playListValues == null) {
      return const Center(
        child: Text(
          'data',
          style: const TextStyle(color: Colors.white),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          addToPlaylist(_playListValues[index].playlistName);
          //  _playListNames[index].playList.add(widget.pathList[widget.index]);
          //    print('path ${widget.pathList[widget.index]} Addeddd to ${_playListValues[index].plVideoPath.toString()}');
          Navigator.of(context).pop();
        },
        child: PlaylistTile(
          playlistName: _playListValues[index].playlistName,
          pListMoviePath: [],
          index: index,
        ),
      );
    }
    // _playListValues.isEmpty
    //             ? const Center(
    //                 child: Text('data', style: TextStyle(color: Colors.white),),
    //               ) : InkWell( onTap:(){ addToPlaylist(_playListValues[index].playlistName);
    //                 //  _playListNames[index].playList.add(widget.pathList[widget.index]);
    //             //    print('path ${widget.pathList[widget.index]} Addeddd to ${_playListValues[index].plVideoPath.toString()}');
    //                 Navigator.of(context).pop();},
    //                 child: PlaylistTile(playlistName: _playListValues[index].playlistName, pListMoviePath: [], index: index,),

    //                 );
  }

  // void addToPlaylist(String name) async {
  //  final playlistToAdd = boxP.values.firstWhere(
  //    (element) => element.playlistName == name);
  //    playlistToAdd.plVideoPath.add(widget.pathList[widget.index]);
  //    print('aaaaaaaaaaaa');
  //    var tab = boxP.values.toList();

  //    for (var i = 0; i < tab.length; i++) {
  //      print('\n\n\n\n\n\n madth bro ${tab[i].plVideoPath.toList().toString()}');
  //    }
  //   //  print(playlistToAdd.plVideoPath.toList().toString());
  //    print('aaaaaaaaaaaa1');

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: Theme.of(context).listTileTheme.shape,
            titleTextStyle: const TextStyle(
                color: Color(0xFFD6B392),
                fontWeight: FontWeight.w500,
                fontSize: 16),
            backgroundColor: const Color(0xFF2D3545),
            title: const Text('Enter the name of the playlist'),
            content: TextField(
              onChanged: (value) {
                playlistNameToHive = value;
              },
              style: const TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white54),
                hintText: 'eg: Watch Later',
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    //  print(playlistNameToHive);

                    if (playlistNameToHive.isNotEmpty) {
                      // await Hive.openBox("MP_BoxP");

                      if (!nameCheck(playlistNameToHive)) {
                        await boxP.add(PlaylistBox(
                            playlistName: playlistNameToHive, plVideoPath: []));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(bottom: 70.0),
                                content: Text("Already in list")));
                      }
                      List<PlaylistBox> valuesIn = boxP.values.toList();
                      for (var i = 0; i < valuesIn.length; i++) {
                        // print('kittuuuuudaaaaaa');
                        // print(valuesIn[i].playlistName);
                      }

                      print('Adding to play list');
                      // playlistNameToHive.clear();
                      Navigator.of(context).pop();
                    } else {
                      // await boxPlaylist.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(color: Color(0xFFD6B392)),
                  ))
            ],
          ));

  bool nameCheck(String text) {
    List<PlaylistBox> _list = Hive.box<PlaylistBox>('MP_BoxP').values.toList();
    bool check = false;
    for (int i = 0; i < _list.length; i++) {
      if (_list[i].playlistName.trim() == text.trim()) {
        check = true;
        break;
      }
    }
    return check;
  }
}
