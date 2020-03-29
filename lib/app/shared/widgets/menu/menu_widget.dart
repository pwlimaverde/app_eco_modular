import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuWidget extends StatelessWidget {
  final int page;
  final Function(int) onTap;

  const MenuWidget({Key key, this.page, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: menuWidth,
      color: Colors.grey[400],
      child: ListView(
        children: <Widget>[
          Container(
            child: ListTile(
              selected: page == 0,
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                onTap(0);
                _navHomePage();
              },
            ),
          ),
          Container(
            child: ListTile(
              selected: page == 1,
              leading: Icon(Icons.file_upload),
              title: Text("Upload"),
              onTap: () {
                onTap(1);
                _navUploadPage();
              },
            ),
          ),
          Container(
            child: ListTile(
              selected: page == 2,
              leading: Icon(Icons.cloud),
              title: Text("Ops"),
              onTap: () {
                onTap(2);
                _navOpsPage();
              },
            ),
          ),
          Container(
            child: ListTile(
              selected: page == 3,
              leading: Icon(Icons.star),
              title: Text("Orçamento Flexo ..."),
              onTap: () {
                onTap(3);
              },
            ),
          ),
        ],
      ),
    );
  }
}

_navHomePage() {
  return Modular.to.pushNamed("/");
}

_navUploadPage() {
  return Modular.to.pushNamed("/upload");
}

_navOpsPage() {
  return Modular.to.pushNamed("/ops");
}
