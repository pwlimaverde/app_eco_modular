import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'uploadcsv_controller.dart';
import 'widgets/right/right_widget.dart';

class UploadcsvPage extends StatefulWidget {
  final String title;

  const UploadcsvPage({Key key, this.title = "Uploadcsv"}) : super(key: key);

  @override
  _UploadcsvPageState createState() => _UploadcsvPageState();
}

class _UploadcsvPageState
    extends ModularState<UploadcsvPage, UploadcsvController> {


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
              ? _rightWidget()
              : Row(
            children: <Widget>[
              controller.menu,
              _rightWidget(),
            ],
          )
        ],
      ),
    );
  }

  _rightWidget() {
    return RightWidget(
      widget: raisedButton(),
      menuWidth: menuWidth,
      showMenu: controller.showMenu,
      sizeW: controller.sizeW,
      controller: controller,
    );
  }

  raisedButton() {
    return RaisedButton(
      child: Text("home - ${controller.sizeW}x${controller.sizeH}"),
      onPressed: _nav,
    );
  }

  _nav() {
    return Modular.to.pushReplacementNamed("/");
  }
}
