import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'components/item/item_widget.dart';

class MenuWidget extends StatelessWidget {
  final int page;
  final Function(int) onTap;

  const MenuWidget({Key key, this.page, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _itensMenu();
  }

  _itensMenu() {
    return Container(
      width: menuWidth,
      color: Colors.grey[400],
      child: ListView(
        children: <Widget>[
          ItemWidget(
            page: page,
            indice: 0,
            nav: "/",
            icon: Icon(Icons.home),
            title: "Home",
          ),
          ItemWidget(
            page: page,
            indice: 1,
            nav: "/upload",
            icon: Icon(Icons.cloud_upload),
            title: "Upload Ops",
          ),
          ItemWidget(
            page: page,
            indice: 2,
            nav: "/ops",
            icon: Icon(Icons.cloud),
            title: "Ops",
          ),
          ItemWidget(
            page: page,
            indice: 3,
            nav: "/pcp",
            icon: Icon(Icons.cloud_done),
            title: "Pcp",
          ),
          ItemWidget(
            page: page,
            indice: 4,
            icon: Icon(Icons.extension),
            title: "Orçamento Flexo ...",
          ),
        ],
      ),
    );
  }
}
