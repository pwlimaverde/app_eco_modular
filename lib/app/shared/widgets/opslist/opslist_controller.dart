import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:mobx/mobx.dart';
import 'opslist_widget.dart';

part 'opslist_controller.g.dart';

class OpslistController = _OpslistControllerBase with _$OpslistController;

abstract class _OpslistControllerBase with Store {

  @observable
  int loadOpCheck;

  @action
  setOpCheck(OpsModel op) {
    loadOpCheck = op.op;
  }

  @action
  setOpCheckCan() async {
    loadOpCheck = await Future<bool>.delayed(Duration(seconds: 1))
        .then((value) => null);
  }

  @observable
  int loadOpCan;

  @action
  setOpCan(OpsModel op) {
    loadOpCan = op.op;
  }

  @action
  setOpCanCan() async {
    loadOpCan = await Future<bool>.delayed(Duration(seconds: 1))
        .then((value) => null);
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
        setOpCheck(o);
        check(o);
        setOpCheckCan();
      },
      can: (OpsModel o) {
        setOpCan(o);
        can(o);
        setOpCanCan();
      },
    );
  }
}
