import 'package:mobx/mobx.dart';

import 'opslist_widget.dart';

part 'opslist_controller.g.dart';

class OpslistController = _OpslistControllerBase with _$OpslistController;

abstract class _OpslistControllerBase with Store {

  opslistWidget(showMenu, filtro){
    return OpslistWidget(showMenu: showMenu, filtro: filtro,);
  }
}
