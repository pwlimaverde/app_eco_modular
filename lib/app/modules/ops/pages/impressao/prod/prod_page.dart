import 'package:eco_web_mobx/app/modules/ops/ops_controller.dart';
import 'package:eco_web_mobx/app/modules/ops/widgets/bodyops/bodyops_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProdPage extends StatefulWidget {
  final String title;
  const ProdPage({Key key, this.title = "Prod"}) : super(key: key);

  @override
  _ProdPageState createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  final controller = Modular.get<OpsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          BodyopsWidget(
            menuWidth: 0,
            showMenu: false,
            sizeH: controller.sizeH,
            sizeW: controller.sizeW,
          )
        ],
      ),
    );
  }
}
