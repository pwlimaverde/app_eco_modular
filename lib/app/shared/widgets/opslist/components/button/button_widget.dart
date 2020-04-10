import 'package:eco_web_mobx/app/shared/widgets/opslist/components/circularprogress/circularprogress_widget.dart';
import 'package:eco_web_mobx/app/shared/widgets/opslist/components/iconbutton/iconbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../opslist_controller.dart';

class ButtonWidget extends StatelessWidget {
  bool crt;
  bool upProd;
  bool cancelarOP;
  bool reativarOP;
  IconData icon;
  Color color;
  Widget button;
  Function onpress;

  ButtonWidget({
    this.crt,
    this.upProd,
    this.color,
    this.icon,
    this.cancelarOP,
    this.reativarOP,
    this.button,
    this.onpress,
  });

  final controller = Modular.get<OpslistController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      print("observer ${controller.clickLoadCan}");
      if (controller.clickLoadCan == true && crt == true) {
          return CircularprogressWidget(
            left: 0,
            right: 0,
            top: 14,
            bottom: 14,
            swidth: 20,
            sheight: 20,
            strok: 2,
            color: color,
          );
      }
      return IconbuttonWidget(
        icon: Icons.cancel,
        color: Colors.red,
        onPressed: () {
          crt = true;
          print("button true $crt");
          onpress;
        },
      );
    });
  }
}
