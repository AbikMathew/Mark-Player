import 'package:flutter/material.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const appBar({Key? key, required this.title}) : super(key: key);

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
      //  style: TextStyle(color: Theme.of(context).iconTheme.color),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
        //  child: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
        )
      ],
    );
  }
}
