import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../app_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {

  final controllerGeral = Modular.get<AppController>();
  get sizeW => controllerGeral.size.width;
  get sizeH => controllerGeral.size.height;
  get showMenu => controllerGeral.showMenu;
  final controllerHeader = Modular.get<HeaderController>();
  get header => controllerHeader.header(sizeW, hederHeight);
  final controllerMenu = Modular.get<MenuController>();
  get menu => controllerMenu.menuWidget(0);

}
