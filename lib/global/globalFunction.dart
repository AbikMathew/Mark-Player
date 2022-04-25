import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mark_player/screens/video_screens.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path/path.dart';
import '../function/searchFiles.dart';
import '../main.dart';
import '../model/model.dart';
//import 'package:collection/collection.dart';

List<Uint8List> thumblist = [];

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(this.pathList);

  late List<String> pathList;

  late List<String> searchTerms = pathList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    // onlyy    movieNameLister();

    for (var movie in searchTerms) {
      if (basenameWithoutExtension(movie)
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(movie);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(basenameWithoutExtension(result)),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var i = 0; i < searchTerms.length; i++) {
      if (basenameWithoutExtension(searchTerms[i]).toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchTerms[i]);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return Column(
            children: [
              // SizedBox(height: 1,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                child: ListTile(
                  title: Text(basenameWithoutExtension(result)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoScreens(
                                  videoFilePath: result,
                                )));
                  },
                ),
              ),
            ],
          );
        });
  }
}







Future getFiles(List<String> _pathList, List<String> repeatedFolderNames,
    List<String> folderNames) async {
  List<String> values = ['mp4', 'avi', 'mov', 'mkv'];
  await SearchFilesInStorage.searchInStorage(
    values,
    (List<String> data) {
      _pathList.clear();
      pathAdderFolderCreator() {
        _pathList.addAll(data);

        for (var i = 0; i < _pathList.length; i++) {
          List<String> PathItemsList = _pathList[i].split('/').toList();
          repeatedFolderNames
              .add(PathItemsList.elementAt(PathItemsList.length - 2));
          folderNames = repeatedFolderNames.toSet().toList();
          folderNames.remove('0');
        }
      }

      ;
      pathAdderFolderCreator();
    },
    (error) {},
  ); //TODO: implement initState
}

Future thumbnailGetter(List<String> pathList) async {
  for (var i = 0; i < pathList.length; i++) {
    Uint8List? key = (await VideoThumbnail.thumbnailData(
      video: pathList[i],
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      quality: 25,
    ));

    box.add(VideoDetailsBox(
        videoFilePath: pathList[i], thumbnailPath: key, fav: false));

    List<VideoDetailsBox> fullDatabaseList = [];
    fullDatabaseList = box.values.toList();

    // DATABASE FUNCTIONS

    //  boxVideos.put(fullDatabaseList[i].key, VideoDetailsBox(videoFilePath: 'abik', thumbnailPath: 'karthik', fav: true));
    //  box.put(fullDatabaseList[i].key, VideoDetailsBox(videoFilePath: 'abik', thumbnailPath: 'karthik', fav: true));

    //  boxVideos.delete(fullDatabaseList[i].key);
    //  box.delete(fullDatabaseList[i].key);
// I JUST TURNED THIS OFF
    // setState(() {});
  }

  print('KittunundOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO');

  // putDbItemstoLists();
}

// putDbItemstoLists() {
//   for (var i = 0; i < fullDatabaseList.length; i++) {
//     pathList.add(fullDatabaseList[i].videoFilePath);
//     thumblist.add(fullDatabaseList[i].thumbnailPath);
//   }
//   _navigateToFolderScreen();
// }

// _navigateToFolderScreen() {
//   //Future.delayed(Duration(milliseconds: 1500), () {});
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (context) => CustomNavbar(
//         pathList: pathList,
//         fullDatabaseList: fullDatabaseList,
//         thumblist: thumblist,
//       ),
//     ),
//   );
// }
