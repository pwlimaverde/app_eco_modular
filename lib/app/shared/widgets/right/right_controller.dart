import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'right_widget.dart';

part 'right_controller.g.dart';

class RightController = _RightControllerBase with _$RightController;

abstract class _RightControllerBase with Store {

  rightWidget({Widget widget, var menuWidth, var showMenu, var sizeW}) {
    return RightWidget(
      widget: widget,
      menuWidth: menuWidth,
      showMenu: showMenu,
      sizeW: sizeW,
    );
  }

}
