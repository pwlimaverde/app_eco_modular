import 'package:eco_web_mobx/app/modules/ops/repositories/ops_interface.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/right/right_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../app_controller.dart';
import 'ops_status.dart';
import 'widgets/bodyops/bodyops_widget.dart';

part 'ops_controller.g.dart';

class OpsController = _OpsControllerBase with _$OpsController;

abstract class _OpsControllerBase with Store {
  final IOpsRepository repository;
  final prefsOps;

  _OpsControllerBase(IOpsRepository this.repository, this.prefsOps) {
    getOpsListAll();
  }

  final controllerGeral = Modular.get<AppController>();
  final controllerHeader = Modular.get<HeaderController>();
  final controllerMenu = Modular.get<MenuController>();
  final controllerRight = Modular.get<RightController>();

  get sizeW => controllerGeral.size.width;

  get sizeH => controllerGeral.size.height;

  get showMenu => controllerGeral.showMenu;

  get header => controllerHeader.header(sizeW, hederHeight);

  get menu => controllerMenu.menuWidget(2);

  get right => controllerRight.rightWidget(
        widget: BodyopsWidget(
          menuWidth: menuWidth,
          showMenu: showMenu,
          sizeH: sizeH,
          sizeW: sizeW,
        ),
        menuWidth: menuWidth,
        showMenu: showMenu,
        sizeW: sizeW,
      );

  @observable
  ObservableStream<List<OpsModel>> opsListAll;

  @action
  getOpsListAll() {
    print("Inicio do carregamento em Conttroler");
    opsListAll = repository.getOpsAll().asObservable();
    print("Carregado em Conttroler");
  }

  @observable
  OpsStatus status = OpsStatus.none;

  @action
  setStatus(OpsStatus statusOPS) {
    status = statusOPS;
  }

  @observable
  Size size;

  @action
  getQuery(context) {
    size = MediaQuery.of(context).size;
  }

  @action
  getQueryMed(context, med, bool showMenu) {
    getQuery(context);
    if (!showMenu) {
      var sizeL = size.width - menuWidth;
      var prop = ((med * sizeL) / 100) - 16;
      return prop;
    }
    var sizeL = size.width;
    var prop = ((med * sizeL) / 100) - 16;
    return prop;
  }

  getSize(size, med) {
    var prop = ((size * med) / 100);
    return prop;
  }
//
//
//  @observable
//  ObservableStream<List<OpsModel>> opsListAll;
//
//  @action
//  getListAll() {
//    opsListAll = repository.getOps().asObservable();
//  }
//
//  @observable
//  bool clickLoadOK = false;
//
//  @action
//  actionUpLoad(OpsModel model, {bool prod = false}) async {
//    clickLoadOK = true;
//    if (prod == true) {
//      await repository.upProd(model);
//    } else {
//      await repository.upEnt(model);
//    }
//    clickLoadOK = false;
//  }
//
//  @observable
//  bool clickLoadCan = false;

//  @action
//  actionCan(OpsModel model, {bool reativar = false}) async {
//    clickLoadCan = true;
//    if (reativar == true) {
//      await repository.atProd(model);
//    } else {
//      await repository.canProd(model);
//    }
//    clickLoadCan = false;
//  }

//  getCorCard(OpsModel model) {
//    return model.produzido != null && model.entrega != null || model.cancelada == true
//        ? Colors.grey[100]
//        : model.status.posicao.toLowerCase().contains("atrasado")
//            ? Colors.red[100]
//            : model.status.posicao.toLowerCase().contains("hoje")
//                ? Colors.yellow[100]
//                : Colors.grey[100];
//  }

}
