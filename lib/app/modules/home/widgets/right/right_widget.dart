import 'package:flutter/material.dart';

class RightWidget extends StatelessWidget {

  var menuWidth;
  var showMenu;
  var sizeW;


  RightWidget({this.menuWidth, this.showMenu, this.sizeW});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: showMenu ? sizeW : sizeW - menuWidth,
      color: Colors.grey[200],
    );
  }
}
