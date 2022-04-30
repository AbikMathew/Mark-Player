import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mark_player/global/globalFunction.dart';
import 'package:mark_player/screens/FolderScreen.dart';
import 'package:mark_player/screens/movies_page.dart';

class SettingsTile extends StatelessWidget {
  final IconData settingsIcon;
  final String settingsText;
  //Widget onTapFunction;

  SettingsTile(
      {required this.settingsIcon, required this.settingsText,  Key? key})
      : super(key: key);
    //Function<Widget> k () onTapFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        leading: Icon(settingsIcon, color: Theme.of(context).iconTheme.color),
        title: Text(settingsText),
        trailing: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).listTileTheme.textColor,
        ),
     //   onTap: whichFunctionOnTap(context, settingsIcon),
      )
    );
  }
   whichFunctionOnTap(BuildContext ctx ,IconData whichIcon ){
    
    if (whichIcon == Icons.info) {
      print('About enkilum kittvo');
      return showAboutDialog(context: ctx);
    }
  }

  tryOne(){
   // getFiles([], [], []);
  }
}
