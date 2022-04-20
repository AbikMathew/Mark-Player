import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final IconData dropDownIcon;
  final String dropDownItem;

  const DropDown(
      {Key? key, required this.dropDownIcon, required this.dropDownItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(dropDownIcon),
        SizedBox(width: 10,),
        Text(dropDownItem),
      ],
    );
  }
}
