import 'package:mobx/mobx.dart';

part 'menudrawer_controller.g.dart';

class MenudrawerController = _MenudrawerBase with _$MenudrawerController;

abstract class _MenudrawerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
