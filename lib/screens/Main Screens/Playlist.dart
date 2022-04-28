import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/playlistTile.dart';
import 'package:mark_player/main.dart';
import 'package:mark_player/model/model.dart';
import 'package:mark_player/screens/Main%20Screens/InsidePlaylist.dart';
import 'package:mark_player/screens/settings.dart';

class PlaylistScreen extends StatefulWidget {
  PlaylistScreen({Key? key}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  //Box<PlaylistBox> boxP1 = Hive.box<PlaylistBox>('MP_BoxP');
  // List<PlaylistBox> playlistBoxValues = boxP.values.toList();

  String playlistNameToHive = '';

  List<String> playlistItems = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: Theme.of(context).listTileTheme.shape,
              titleTextStyle: TextStyle(color: Color(0xFFD6B392)),
              backgroundColor: Color(0xFF2D3545),
              title: Text('Enter the name of the playlist'),
              content: TextField(
                onChanged: (value) {
                  playlistNameToHive = value;
                },
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white54),
                  hintText: 'eg: Watch Later',
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () async{
                    //  print(playlistNameToHive);

                      if (playlistNameToHive.isNotEmpty) {
                                              // await Hive.openBox("MP_BoxP");

                                              if (!nameCheck(playlistNameToHive)) {
                                                await boxP.add(PlaylistBox(playlistName: playlistNameToHive, plVideoPath: []));
                                                
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        duration: Duration(
                                                            seconds: 1),
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        margin: EdgeInsets.only(
                                                            bottom: 70.0),
                                                        content: Text(
                                                            "Already in list")));
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
                    child: Text(
                      'Create',
                      style: TextStyle(color: Color(0xFFD6B392)),
                    ))
              ],
            ));

    return Scaffold(
      appBar: appBar(title: 'Playlists', visible: false),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: boxP.listenable(),
          builder: (context, Box<PlaylistBox> value, child) {
            List<PlaylistBox> _playlistValues = value.values.toList();
            return ListView.builder(
                //itemCount: Hive.box<PlaylistBox>('MP_BoxP').length,
                itemCount: _playlistValues.length,
                //   itemCount: ,
                //playlistNamesList.length,
                itemBuilder: ((context, index) {
                  List<String> pListMoviePath = _playlistValues[index].plVideoPath;
                  
                  // print('Hereee');
                  // print(pListMoviePath.toString());

                  return _playlistValues.isEmpty
                      ? Center(
                          child: Container(
                          child: Text('haaaaaaaa'),
                        ))
                      //Text('Onnum illa'))
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => InnerPlaylist(
                                    plMoviePath: pListMoviePath,
                                    plName: _playlistValues[index].playlistName,
                                    index: index
                                  ),
                                ));
                          },
                          child: PlaylistTile(
                              playlistName: _playlistValues[index].playlistName,
                              pListMoviePath: pListMoviePath),
                        );
                  // return PlaylistTile(
                  //     playlistName: _playlistValues[index].playlistName, pListMoviePath: pListMoviePath,);
                  //     return PlaylistTile(playlistName: playlistNamesList[index].playListName);
                }));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        backgroundColor: Color(0xFFD6B392),
        child: Icon(
          Icons.playlist_add,
          color: Color(0xFF2D3545),
        ),
      ),
    );
  }

  // addNametoDB(String playlistName) {
  //   List<String> playlistNames = [];

  //   for (var i = 0; i < playlistBoxValues.length; i++) {
  //     playlistNames.add(playlistBoxValues[i].playlistName);
  //   }

  //   if (playlistName != '') {
  //     if (playlistNames.isEmpty) {
  //       print('Innengaaanum nadakkuvooo');
  //       boxP.add(PlaylistBox(playlistName: playlistName, plVideoPath: []));
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (con) => PlaylistScreen()));
  //       setState(() {});
  //     } else {
  //       for (var i = 0; i < playlistNames.length; i++) {
  //         if (playlistNames[i] == playlistName) {
  //           print('Vere vello panikkum po');
  //         } else {
  //           print('Kittiyooooooooooooooooooooooooooooo11');
  //           boxP.add(PlaylistBox(playlistName: playlistName, plVideoPath: []));
  //           Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (con) => PlaylistScreen()));
  //           break;
  //           setState(() {});
  //         }
  //       }
  //     }
  //   }
  // }
}


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