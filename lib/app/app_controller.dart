import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {

  bool get showMenu => size.width <= 1080;

  @observable
  Orientation orientation;

  @observable
  Size size;

  @action
  getQuery(context) {
    size = MediaQuery.of(context).size;
    orientation = MediaQuery.of(context).orientation;
  }
}
