import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mark_player/custom%20widgets/drop_down.dart';
//import 'package:mark_player/screens/movies_page.dart';
import 'package:mark_player/screens/video_screens.dart';
import 'package:path/path.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MovieTile extends StatefulWidget {
  MovieTile({
    Key? key,
    required this.pathList,
    required this.movieNamesList,
    required this.index,
    required this.moviesTitle,
    required this.thumbnailPhoto
  }) : super(key: key);

  // final List<String> folderNames;
  int index;
  List<String> movieNamesList;
  List<String> pathList;
  String moviesTitle;
  var thumbnailPhoto;
  //String? thumbnailPhoto;

  // getThumbnail(String videoPath) async{
  //   return thumbnailPhoto = await VideoThumbnail.thumbnailData(
  //       video: videoPath,
  //       imageFormat: ImageFormat.JPEG,
  //       maxWidth:
  //           128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  //       quality: 25) ;
  // }

//  getThumbnail(String videopath) async{
//  final uint8list = await VideoCompress.getFileThumbnail(
//   videopath,
//   quality: 50, // default(100)
//   position: -1 // default(-1)
// );
// }

  @override
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  // @override
  // void initState() {
  //   thumbnailGetter();
  //   super.initState();
  // }

  // List thumbnailList = [];
  // List<String> viewList = [];
  // var thumbnailPhoto;

  // Future thumbnailGetter() async{
  //   for (var i = 0; i < widget.movieNamesList.length; i++) {
  //     thumbnailPhoto = await getThumbnail(widget.movieNamesList[i]);
  //     thumbnailList.add(thumbnailPhoto!);
      
  //   }
   
  // }

  // getThumbnail(String videoPath)  {
  //   thumbnailPhoto = ( VideoThumbnail.thumbnailData(
  //       video: videoPath,
  //       imageFormat: ImageFormat.JPEG,
  //       maxWidth:
  //           128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  //       quality: 25));

  //   thumbnailList.add(thumbnailPhoto);
  //   print(thumbnailList);
  //   setState(() {});
  // }



  //   Future thumbnailGetter() async {
  //   for (var i = 0; i < widget.pathList.length; i++) {
  //    // print('${widget.pathList[i]}');
  //     List<String> video = widget.pathList[i].split('/').toList();
  //    // print(video);
  //     if (video.contains(widget.moviesTitle)) {
  //       String url = video.join('/');
  //       // String name = video[video.length-1];

  //       var key = (await VideoThumbnail.thumbnailData(
  //         video: url,
  //         imageFormat: ImageFormat.JPEG,
  //         maxWidth: 128,
  //         quality: 25,
  //       ));
  //       thumbnailList.add(key);
  //       setState(() {});
  //       viewList.add(url);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
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
                //  image: FileImage(File(fileKitti))))),
              //  image: MemoryImage(thumbnailList[widget.index]),
              image: MemoryImage(widget.thumbnailPhoto),
              ),
              //
            ),
          ),
        ),

        // child: Image.asset(
        //   'asset/unsplash1.jpg',
        //   height: 99,
        //   width: 80,
        //   fit: BoxFit.fitHeight,
        // ),

        // FaIcon(FontAwesomeIcons.folder,
        //     color: Theme.of(context).iconTheme.color),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: DropDown(
                    dropDownIcon: Icons.favorite,
                    dropDownItem: 'Add to favourites'),
              ),
              PopupMenuItem(
                  child: DropDown(
                      dropDownIcon: Icons.watch_later,
                      dropDownItem: 'Add to watch later')),
              PopupMenuItem(
                  child: DropDown(
                      dropDownIcon: Icons.share, dropDownItem: 'Share'))
            ];
          },
          icon: Icon(Icons.more_vert,
              color: Theme.of(context).listTileTheme.textColor),
        ),
        subtitle: Text(''),
        title: Text(
          basenameWithoutExtension(widget.movieNamesList[widget.index]),
          style: TextStyle(color: Theme.of(context).listTileTheme.textColor),
        ),
      ),
    );
  }
}
