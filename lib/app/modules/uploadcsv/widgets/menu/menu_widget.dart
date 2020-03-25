import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {

  var controller;

  MenuWidget({this.controller});

  @override
  Widget build(BuildContext context) {
    return _container();
  }

  _container() {
    return Container(
      width: menuWidth,
      color: Colors.grey[400],
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.file_upload),
              onPressed: () => controller.uploadOps(),
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
