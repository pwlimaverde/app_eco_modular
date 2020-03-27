import 'package:flutter/material.dart';

class CircularprogressWidget extends StatelessWidget {

  double top;
  double bottom;
  double left;
  double right;
  double swidth;
  double sheight;
  double strok;
  Color color;


  CircularprogressWidget({this.top, this.bottom, this.left, this.right,
      this.swidth, this.sheight, this.strok, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: SizedBox(
        width: swidth,
        height: sheight,
        child: CircularProgressIndicator(strokeWidth: strok, valueColor: AlwaysStoppedAnimation(color),),
      ),
    );
  }
}
