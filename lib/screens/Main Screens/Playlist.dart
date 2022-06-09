
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/controllers/playlist_controller.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/playlistTile.dart';
import 'package:mark_player/main.dart';
import 'package:mark_player/model/model.dart';
import 'package:mark_player/screens/Main%20Screens/InsidePlaylist.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  //Box<PlaylistBox> boxP1 = Hive.box<PlaylistBox>('MP_BoxP');
  // List<PlaylistBox> playlistBoxValues = boxP.values.toList();

  PlaylistController controller = Get.put(PlaylistController());
  String playlistNameToHive = '';

  List<String> playlistItems = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    Future openDialog1(String playlistName, int index) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: Theme.of(context).listTileTheme.shape,
              titleTextStyle: const TextStyle(color: Color(0xFFD6B392)),
              backgroundColor: const Color(0xFF2D3545),
              title: const Text('Delete Playlist'),
              content: Text(
                'Do you want to delete the playlist named $playlistName?',
                style: const TextStyle(color: Colors.white54),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child:
                        const Text('No', style: TextStyle(color: Color(0xFFD6B392)))),
                TextButton(
                    onPressed: () => controller.deletePlaylist(index: index),
                    //  onPressed: () => removePlaylist(playlistName, context),
                    child: const Text('Yes',
                        style: TextStyle(color: Color(0xFFD6B392)))),
              ],
            ));

    Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: Theme.of(context).listTileTheme.shape,
              titleTextStyle: const TextStyle(
                  color: Color(0xFFD6B392), fontWeight: FontWeight.bold),
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
                              playlistName: playlistNameToHive,
                              plVideoPath: []));
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
                        setState(() {
                          
                        });
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

    return Scaffold(
      appBar: appBar(title: 'Playlists', visible: false),
      body: SafeArea(
        child: GetBuilder<PlaylistController>(
          builder: (controller) {

            print('build  ആവുന്നുണ്ടോ മോനേ ');
            List<PlaylistBox> _playlistValues =
                controller.playlistObservableBox.values.toList();

            return ListView.builder(
                itemCount: _playlistValues.length,
                itemBuilder: ((context, index) {
                  List<String> pListMoviePath =
                      _playlistValues[index].plVideoPath;

                  return GestureDetector(
                      onLongPress: () => openDialog1(
                          _playlistValues[index].playlistName, index),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => InnerPlaylist(
                                  plMoviePath: pListMoviePath,
                                  plName: _playlistValues[index].playlistName,
                                  index: index),
                            ));
                      },
                      child: PlaylistTile(
                          playlistName: _playlistValues[index].playlistName,
                          pListMoviePath: pListMoviePath,
                          index: index));
                }));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        // controller.clear();
          openDialog();
        },
        backgroundColor:   const Color(0xFFD6B392),
        child: const Icon(
          Icons.playlist_add,
          color: Color(0xFF2D3545),
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

bool nameCheck(String text) {

  PlaylistController ctr = Get.find<PlaylistController>();

  List<PlaylistBox> _list = ctr.playlistObservableBox.values.toList();

  bool check = false;
  for (int i = 0; i < _list.length; i++) {
    if (_list[i].playlistName.trim() == text.trim()) {
      check = true;
      break;
    }
  }
  return check;
}



// return Scaffold(
//       appBar: appBar(title: 'Playlists', visible: false),
//       body: SafeArea(
//         child: ValueListenableBuilder(
//           valueListenable: boxP.listenable(),
//           builder: (context, Box<PlaylistBox> value, child) {
//             List<PlaylistBox> _playlistValues = value.values.toList();
//             return ListView.builder(
//                 itemCount: _playlistValues.length,
//                 itemBuilder: ((context, index) {
//                   List<String> pListMoviePath =
//                       _playlistValues[index].plVideoPath;

//                   // print('Hereee');
//                   // print(pListMoviePath.toString());

//                   return _playlistValues.isEmpty
//                       ? Center(
//                           child: Container(
//                           child: Text('haaaaaaaa'),
//                         ))
//                       //Text('Onnum illa'))
//                       : GestureDetector(
//                           onLongPress: () =>
//                               openDialog1(_playlistValues[index].playlistName, index),
//                           onTap: () {

//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (ctx) => InnerPlaylist(
//                                       plMoviePath: pListMoviePath,
//                                       plName:
//                                           _playlistValues[index].playlistName,
//                                       index: index),
//                                 ));
//                           },
//                           child: PlaylistTile(
//                               playlistName: _playlistValues[index].playlistName,
//                               pListMoviePath: pListMoviePath,
//                               index: index));
//                 }));
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           openDialog();
//         },
//         backgroundColor: Color(0xFFD6B392),
//         child: Icon(
//           Icons.playlist_add,
//           color: Color(0xFF2D3545),
//         ),
//       ),
//     );