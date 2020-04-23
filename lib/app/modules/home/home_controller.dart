import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/right/right_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../app_controller.dart';
import 'widgets/bodyhome/bodyhome_widget.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  _HomeBase(){
    signIn();
  }

  final controllerGeral = Modular.get<AppController>();
  final controllerHeader = Modular.get<HeaderController>();
  final controllerMenu = Modular.get<MenuController>();
  final controllerRight = Modular.get<RightController>();

  get sizeW => controllerGeral.size.width;

  get sizeH => controllerGeral.size.height;

  get showMenu => controllerGeral.showMenu;

  get header => controllerHeader.header(sizeW, hederHeight);

  get menu => controllerMenu.menuWidget(0);

  get right => controllerRight.rightWidget(
        widget: BodyhomeWidget(
          sizeH: sizeH,
          sizeW: sizeW,
        ),
        menuWidth: menuWidth,
        showMenu: showMenu,
        sizeW: sizeW,
      );



  Future signIn() async {
    print("inicio login");
    try {
      var auth =
      await _auth.signInWithEmailAndPassword(email: "pwlimaverde@gmail.com", password: "Pwp57q30p");

      print(auth.user);
      return auth.user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
