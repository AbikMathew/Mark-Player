import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mark_player/controllers/favourites_controller.dart';
import 'package:mark_player/custom%20widgets/drop_down.dart';
import 'package:mark_player/screens/video_screens.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';

class FavouritesTile extends StatelessWidget {
  FavouritesTile({Key? key, required this.videoPath, required this.index})
      : super(key: key);
  final String videoPath;
  final FavoritesController favController = Get.find<FavoritesController>();
  final index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        shape: Theme.of(context).listTileTheme.shape,
        title: Text(
          basenameWithoutExtension(videoPath),
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () => Get.to(
          VideoScreens(
            videoFilePath: videoPath,
          ),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () => favController.deleteFromFav(index),
                child: const DropDown(
                  dropDownIcon: Icons.remove,
                  dropDownItem: 'Remove from Favourites',
                ),
              ),
              PopupMenuItem(
                onTap: () async {
                  await Share.shareFiles([videoPath]);
                },
                child: const DropDown(
                    dropDownIcon: Icons.share, dropDownItem: 'Share'),
              )
            ];
          },
          icon: Icon(Icons.more_vert,
              color: Theme.of(context).listTileTheme.textColor),
        ),
      ),
    );
  }
}

// PopupMenuItem(
//               onTap: () {
//                 //widget.favController.favObservableBox.clear();
//                 favController.deleteFromFav(index: index)
//                 // setState(() {

//                 // });
//               },
//               child: const DropDown(
//                   dropDownIcon: Icons.favorite,
//                   dropDownItem: 'Add to favourites'),
//             )