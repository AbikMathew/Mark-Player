import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mark_player/controllers/favourites_controller.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';

import '../../custom widgets/favourites_tile.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({Key? key}) : super(key: key);

  final FavoritesController controller = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    // controller.favObservableBox.clear();
    return Scaffold(
      appBar: appBar(
        title: 'Favourites',
        visible: true,
      ),
      body: Center(
        child: GetBuilder<FavoritesController>(builder: (controller) {
          return controller.favObservableBox.values.toList().isEmpty
              ? const Center(child: Text('No Videos added to favourites',style: TextStyle(color: Colors.white54),),)
              : ListView.builder(
                  itemCount: a.length,
                  itemBuilder: (ctx, index) {
                    return FavouritesTile(
                      videoPath: controller.favObservableBox.values
                          .toList()[index]
                          .favVideoPath,
                    );
                  },
                );
        }),
      ),
    );
  }
}

List<String> a = ['sdfs/aa.mp4', 'sdfs/asa.mp4', 'fgsdfs/aa.mp4'];
