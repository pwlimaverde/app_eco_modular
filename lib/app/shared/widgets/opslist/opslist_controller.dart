import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:mobx/mobx.dart';
import 'opslist_widget.dart';

part 'opslist_controller.g.dart';

class OpslistController = _OpslistControllerBase with _$OpslistController;

abstract class _OpslistControllerBase with Store {
  @observable
  bool clickLoadOK = true;

  @action
  actionUpLoad(bool load) {
    Future.delayed(Duration(milliseconds: 2000))
        .then((value) => clickLoadOK = load);
  }

  @observable
  bool clickLoadCan = false;

  @action
  actionCan(bool load) async {
    clickLoadCan = load == true
        ? load
        : await Future<bool>.delayed(Duration(seconds: 1))
            .then((value) => load);
  }

  opslistWidget(
    showMenu,
    filtro,
    check,
    can,
  ) {
    return OpslistWidget(
      showMenu: showMenu,
      filtro: filtro,
      check: (OpsModel o) {
        actionUpLoad(true);
        check(o);
        actionUpLoad(false);
      },
      can: (OpsModel o) {
        actionCan(true);
        can(o);
        actionCan(false);
      },
    );
  }
}
