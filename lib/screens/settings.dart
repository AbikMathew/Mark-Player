import 'package:flutter/material.dart';
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
          SettingsTile(settingsIcon: Icons.share, settingsText: 'Share'),
          SettingsTile(settingsIcon: Icons.star, settingsText: 'Rating'),
          SettingsTile(settingsIcon: Icons.info, settingsText: 'About')
        ],
      ),
      // bottomNavigationBar: customNavbar(),
    );
  }
}
