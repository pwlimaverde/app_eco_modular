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

  final controllerHeader = Modular.get<HeaderController>();
  final controllerMenu = Modular.get<MenuController>();


  bool get showMenu => controller.size.width <= 1080;
  double get sizeW => controller.size.width;
  double get sizeH => controller.size.height;

  //use 'controller' variable to access controller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.uploadOps();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          controllerHeader.observerHeader(),
          _observerBody(),
        ],
      ),
    );
  }

  _observerBody() {
    controller.getQuery(context);
    return Observer(
      builder: (_) {
        return Container(
          width: sizeW,
          height: sizeH - hederHeight,
          child: Row(
            children: <Widget>[
              showMenu
                  ? _rightWidget()
                  : Row(
                      children: <Widget>[
                        controllerMenu.observerMenuWidget(),
                        _rightWidget(),
                      ],
                    )
            ],
          ),
        );
      },
    );
  }

  _rightWidget() {
    return RightWidget(
      menuWidth: menuWidth,
      showMenu: showMenu,
      sizeW: sizeW,
      controller: controller,
    );
  }
}
