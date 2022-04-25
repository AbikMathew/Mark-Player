import 'package:flutter/material.dart';

import '../global/globalFunction.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  appBar(
      {Key? key,
      required this.title,
      required this.visible,
      this.movieNamesList})
      : super(key: key);

  List<String>? movieNamesList;
  bool visible;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title,
          style: TextStyle(color: Theme.of(context).iconTheme.color),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        Visibility(
          visible: visible,
          child: IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(movieNamesList!));
              },
              icon: const Icon(Icons.search, color: Color(0xFFD6B392))),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          //  child: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
        )
      ],
    );
  }
}
