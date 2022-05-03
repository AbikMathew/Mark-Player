import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';

import 'package:mark_player/custom%20widgets/settings_tile.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Settings', visible: false,),
      body: ListView(
        children: [
          SettingsTile(settingsIcon: Icons.star, settingsText: 'Rating', ),
          SettingsTile(settingsIcon: Icons.share, settingsText: 'Share', ),
          GestureDetector(
            child: SettingsTile(settingsIcon: Icons.info, settingsText: 'About', ),
           
            onTap: (){
              HapticFeedback.heavyImpact();
              showAboutDialog(context: context);})
        ],
      ),
      // bottomNavigationBar: customNavbar(),
    );
  }
   shareTap(){
     print('object');
     return Container();
   }
   ratingTap(){
     print('object');
     return Container();
   }
   aboutTap(BuildContext ctx){
     return showAboutDialog(context: ctx);
   }
}
