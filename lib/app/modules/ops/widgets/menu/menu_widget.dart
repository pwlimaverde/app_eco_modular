import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../ops_status.dart';

class MenuWidget extends StatelessWidget {
  var controller;

  MenuWidget({this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _container();
    });
  }

  _container() {
    controller.status;
    return Container(
      width: menuWidth,
      color: Colors.grey[400],
      child: ListView(
        children: <Widget>[
          Container(
            child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.file_upload),
                  onPressed: () => _navUploadPage(),
                ),
                title: Text("Upload")),
          ),
          Container(
            color: Colors.blueGrey,
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.cloud),
                onPressed: () => null,
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
