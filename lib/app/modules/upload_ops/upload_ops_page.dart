import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_controller.dart';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'upload_ops_controller.dart';
import 'upload_ops_module.dart';

class UploadOpsPage extends StatefulWidget {

  final String title;

  const UploadOpsPage({Key key, this.title = "UploadOps"}) : super(key: key);

  @override
  _UploadOpsPageState createState() => _UploadOpsPageState();
}

class _UploadOpsPageState
    extends ModularState<UploadOpsPage, UploadOpsController> {
  //use 'controller' variable to access controller

  final controller = UploadOpsModule.to.get<UploadOpsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text("Upload"),
              onPressed: () => controller.uploadOps(context),
            ),
          ),
        ],
      ),
    );
  }
}
