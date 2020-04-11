import 'package:flutter/material.dart';

class IconbuttonWidget extends StatelessWidget {

    IconData icon;
    Color color;
    Function onPressed;


    IconbuttonWidget({this.icon, this.color, this.onPressed});

    @override
    Widget build(BuildContext context) {
        return IconButton(
            icon: Icon(
                icon,
                size: 20,
                color: color,
            ),
            padding: EdgeInsets.all(4),
            onPressed: onPressed,
        );
    }
}
