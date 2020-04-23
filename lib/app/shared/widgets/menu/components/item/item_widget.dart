import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemWidget extends StatelessWidget {
  var page;
  String nav;
  int indice;
  Icon icon;
  String title;

  ItemWidget({
    this.page,
    this.indice,
    this.nav,
    this.icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        selected: page == indice,
        leading: icon,
        title: Text("$title"),
        onTap: () {
          _nav();
        },
      ),
    );
  }
  _nav() {
    return page==indice?null:nav!=null?Modular.to.pushReplacementNamed("$nav"):null;
  }
}
