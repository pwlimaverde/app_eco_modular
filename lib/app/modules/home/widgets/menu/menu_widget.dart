import 'dart:html';

import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: menuWidth,
      color: Colors.grey[400],
      child: ListView(
        children: <Widget>[
          Center(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.file_upload),
                onPressed: () {
                    _navUploadPage();
                },
              ),
              title: Text("Upload"),
            ),
          ),
          Container(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.cloud),
                onPressed: () {
                  _navOpsPage();
                },
              ),
              title: Text("Ops"),
            ),
          ),
          Container(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.star),
                onPressed: () => null,
              ),
              title: Text("Orçamento Flexo ..."),
            ),
          ),
        ],
      ),
    );
  }
}

_navUploadPage() {
  return Modular.to.pushNamed("/upload");
}

_navOpsPage() {
  return Modular.to.pushNamed("/ops");
}