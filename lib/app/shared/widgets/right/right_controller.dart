import 'package:mobx/mobx.dart';

part 'right_controller.g.dart';

class RightController = _RightControllerBase with _$RightController;

abstract class _RightControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
