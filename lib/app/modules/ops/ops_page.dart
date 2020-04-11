import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'ops_controller.dart';

class OpsPage extends StatefulWidget {
  final String title;

  const OpsPage({Key key, this.title = "Ops"}) : super(key: key);

  @override
  _OpsPageState createState() => _OpsPageState();
}

class _OpsPageState extends ModularState<OpsPage, OpsController> {
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
