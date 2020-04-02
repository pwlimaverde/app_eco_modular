import 'package:flutter/material.dart';

class RightWidget extends StatelessWidget {

  var menuWidth;
  var showMenu;
  var sizeW;
  Widget widget;


  RightWidget({this.menuWidth, this.showMenu, this.sizeW, this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: widget,
        ),
        Container(
          width: showMenu ? sizeW : sizeW - menuWidth,
          color: Colors.grey[200],
        ),
      ],
    );
  }
}
