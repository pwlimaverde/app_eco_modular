import 'package:eco_web_mobx/app/app_module.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_controller.dart';
import 'widgets/right/right_widget.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Sistema Ecoprint"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controllerGeral = AppModule.to.get<AppController>();
  final controllerHeader = Modular.get<HeaderController>();
  final controllerMenu = Modular.get<MenuController>();
  double get sizeW => controllerGeral.size.width;
  double get sizeH => controllerGeral.size.height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerGeral.getQuery(context);
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
    return Observer(
      builder: (_) {
        return Container(
          width: sizeW,
          height: sizeH - hederHeight,
          child: Row(
            children: <Widget>[
              controllerGeral.showMenu
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
      showMenu: controllerGeral.showMenu,
      sizeW: sizeW,
    );
  }
}
