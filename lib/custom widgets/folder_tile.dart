import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mark_player/custom%20widgets/drop_down.dart';
import 'package:mark_player/screens/settings.dart';

import '../screens/movies_page.dart';

class folderTile extends StatelessWidget {
  folderTile(
      {Key? key,
      required this.pathList,
      required this.folderNames,
      required this.index,
      required this.thumbList})
      : super(key: key);

  final List<String> pathList;
  final List<Uint8List> thumbList;
  final List<String> folderNames;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    // settingsPage()
                    MoviesPage(
                      moviesTitle: folderNames[index],
                      pathList: pathList,
                      thumbList: thumbList,
                    ))),
        shape: Theme.of(context).listTileTheme.shape,
        tileColor: Theme.of(context).listTileTheme.tileColor,
        leading: FaIcon(FontAwesomeIcons.folder,
            color: Theme.of(context).iconTheme.color),
        //
        title: Text(
          folderNames[index],
          style: TextStyle(color: Theme.of(context).listTileTheme.textColor),
        ),
      ),
    );
  }
}

// trailing: PopupMenuButton(
//   itemBuilder: (BuildContext context) {
//     return [
//       PopupMenuItem(
//         child: DropDown(
//             dropDownIcon: Icons.favorite,
//             dropDownItem: 'Add to favourites'),
//       ),
//       PopupMenuItem(
//           child: DropDown(
//               dropDownIcon: Icons.watch_later,
//               dropDownItem: 'Add to watch later')),
//       PopupMenuItem(
//           child: DropDown(
//               dropDownIcon: Icons.share, dropDownItem: 'Share'))
//     ];
//   },
//   icon: Icon(Icons.more_vert,
//       color: Theme.of(context).listTileTheme.textColor),
// ),
