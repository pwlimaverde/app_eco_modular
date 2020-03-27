import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'ops_controller.dart';

class OpsPage extends StatefulWidget {
  final String title;
  const OpsPage({Key key, this.title = "Ops"}) : super(key: key);

  @override
  _OpsPageState createState() => _OpsPageState();
}

class _OpsPageState extends ModularState<OpsPage, OpsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
