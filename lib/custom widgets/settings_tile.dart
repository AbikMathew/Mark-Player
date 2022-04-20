import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mark_player/screens/FolderScreen.dart';
import 'package:mark_player/screens/movies_page.dart';

class SettingsTile extends StatelessWidget {
  final IconData settingsIcon;
  final String settingsText;

  SettingsTile(
      {required this.settingsIcon, required this.settingsText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        // onTap: () {
        //   Future.delayed(Duration.zero, () {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) => MoviesPage(MoviesTitle: 'hai'),
        //     ),
        //   );
        //   });
        // },
        leading: Icon(settingsIcon, color: Theme.of(context).iconTheme.color),
        title: Text(settingsText),
        trailing: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).listTileTheme.textColor,
        ),
      ),
    );
  }
}
