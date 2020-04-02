import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'header_widget.dart';

part 'header_controller.g.dart';

class HeaderController = _HeaderControllerBase with _$HeaderController;

abstract class _HeaderControllerBase with Store {

  header(double width, double height,) {
    return HeaderWidget(
      width: width,
      height: height,
      color: Colors.grey[800],
      tilulo: "Sistema Ecoprint",
    );
  }
}
