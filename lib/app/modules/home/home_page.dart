import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Sistema Ecoprint"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.controllerGeral.getQuery(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          controller.header,
          _body(),
        ],
      ),
    );
  }

  _body() {
    return Container(
      width: controller.sizeW,
      height: controller.sizeH - hederHeight,
      child: Row(
        children: <Widget>[
          controller.showMenu
              ? controller.right
              : Row(
                  children: <Widget>[
                    controller.menu,
                    controller.right,
                  ],
                )
        ],
      ),
    );
  }

}
