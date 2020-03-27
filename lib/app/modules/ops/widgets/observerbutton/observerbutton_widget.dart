import 'package:eco_web_mobx/app/modules/ops/model/ops_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../circularprogress/circularprogress_widget.dart';
import '../iconbutton/iconbutton_widget.dart';

class ObserverbuttonWidget extends StatelessWidget {

  bool crt;
  bool upProd;
  bool cancelarOP;
  bool reativarOP;
  IconData icon;
  Color color;
  OpsModel model;
  var controller;

  ObserverbuttonWidget(
      {this.crt,
        this.upProd,
        this.model,
        this.color,
        this.icon,
        this.cancelarOP,
        this.controller,
        this.reativarOP
      });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (cancelarOP == true) {
        if (controller.clickLoadCan == true) {
          if (crt == true) {
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
              icon: icon,
              color: color,
              onPressed: () {
                crt = true;
                if(reativarOP == true){
                  controller.actionCan(model, reativar: reativarOP);
                  return;
                }
                controller.actionCan(model);
              });
        }
        return IconbuttonWidget(
            icon: icon,
            color: color,
            onPressed: () {
              crt = true;
              if(reativarOP == true){
                controller.actionCan(model, reativar: reativarOP);
                return;
              }
              controller.actionCan(model);
            });
      } else {
        if (controller.clickLoadOK == true) {
          if (crt == true) {
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
              icon: icon,
              color: color,
              onPressed: () {
                crt = true;
                if (upProd == true) {
                  controller.actionUpLoad(model, prod: upProd);
                  return;
                }
                controller.actionUpLoad(model, prod: upProd);
              });
        }
        return IconbuttonWidget(
            icon: icon,
            color: color,
            onPressed: () {
              crt = true;
              if (upProd == true) {
                controller.actionUpLoad(model, prod: upProd);
                return;
              }
              controller.actionUpLoad(model, prod: upProd);
            });
      }
    });
  }
}
