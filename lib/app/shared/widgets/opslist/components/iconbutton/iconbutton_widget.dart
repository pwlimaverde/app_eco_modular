import 'package:flutter/material.dart';

class IconbuttonWidget extends StatelessWidget {

  IconData icon;
  Color color;
  Function onPressed;
  bool isImp;


  IconbuttonWidget({this.icon, this.color, this.onPressed,this.isImp = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 15,
        color: color,
      ),
      padding: EdgeInsets.all(4),
      onPressed: isImp?onPressed:null,
    );
  }
}
