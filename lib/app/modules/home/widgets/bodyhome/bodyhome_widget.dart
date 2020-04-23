import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BodyhomeWidget extends StatelessWidget {

  var sizeH;
  var sizeW;


  BodyhomeWidget({this.sizeH, this.sizeW});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
//      color: Colors.green,
      child: Center(
        child: Text("Bem vindo.", style: TextStyle(fontSize: 30),),
      ),
    );
  }

  _raisedButton() {
    return RaisedButton(
      child: Text("upload - ${sizeW}x${sizeH}"),
      onPressed: _nav,
    );
  }

  _nav() {
    return Modular.to.pushReplacementNamed("/upload");
  }

}
