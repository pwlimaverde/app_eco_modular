import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../../uploadcsv_controller.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends ModularState<MenuWidget, UploadcsvController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: menuWidth,
      color: Colors.grey[400],
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.file_upload),
              onPressed: () => controller.uploadOps(context),
            ),
            title: Text("Upload"),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Item 2"),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Item 3"),
          ),
        ],
      ),
    );
  }
}