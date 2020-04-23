import 'package:mobx/mobx.dart';

import 'menu_widget.dart';

part 'menu_controller.g.dart';

class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {


  menuWidget(int page) {
    return MenuWidget(
      page: page,
    );
  }
}
