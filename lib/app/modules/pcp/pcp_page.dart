import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pcp_controller.dart';

class PcpPage extends StatefulWidget {
  final String title;

  const PcpPage({Key key, this.title = "Ops"}) : super(key: key);

  @override
  _PcpPageState createState() => _PcpPageState();
}

class _PcpPageState extends ModularState<PcpPage, PcpController> {
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
