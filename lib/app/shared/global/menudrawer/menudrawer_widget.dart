import 'package:flutter/material.dart';
import 'widgets/drawerlist/drawerlist_widget.dart';


class MenudrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: DrawerlistWidget(),
      ),
    );
  }
}
