import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  var width;
  var height;
  var color;
  String tilulo;


  HeaderWidget({this.width, this.height, this.color, this.tilulo});

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.all(8),
      width: width,
      height: height,
      color: color,
      child: ListTile(
        leading: FlutterLogo(size: 30,),
        title: Text("$tilulo", style: TextStyle(color: Colors.white, fontSize: 18),),
        trailing: _login(),
      ),
    );
  }

  _login() {
    return Container(
      width: 120,
      child: Row(
        children: <Widget>[
          Text("Login aqui"),
        ],
      ),
    );
  }
}
