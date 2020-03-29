import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../app_controller.dart';
import 'header_widget.dart';

part 'header_controller.g.dart';

class HeaderController = _HeaderControllerBase with _$HeaderController;

abstract class _HeaderControllerBase with Store {

  final controllerGeral = Modular.get<AppController>();
  double get sizeW => controllerGeral.size.width;
  double get sizeH => controllerGeral.size.height;

  observerHeader() {
    print("heder global");
    return Observer(
      builder: (_) {
        return HeaderWidget(
          width: sizeW,
          height: hederHeight,
          color: Colors.grey[800],
          tilulo: "Sistema Ecoprint  ${sizeW} / ${sizeH}",
        );
      },
    );
  }

}
