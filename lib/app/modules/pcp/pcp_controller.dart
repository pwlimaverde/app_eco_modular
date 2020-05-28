import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/opslist/opslist_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/right/right_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../app_controller.dart';
import 'pcp_status.dart';
import 'repositories/pcp_interface.dart';
import 'widgets/bodyops/bodyops_widget.dart';

part 'pcp_controller.g.dart';

class PcpController = _PcpControllerBase with _$PcpController;

abstract class _PcpControllerBase with Store {
  final IPcpRepository repository;
  final prefsOps;

  _PcpControllerBase(IPcpRepository this.repository, this.prefsOps) {
    getOpsListRyob();
    getOpsListSm2c();
    getOpsListSm4c();
    getOpsListFlexo();
  }

  String busca;

  final controllerGeral = Modular.get<AppController>();
  final controllerHeader = Modular.get<HeaderController>();
  final controllerMenu = Modular.get<MenuController>();
  final controllerRight = Modular.get<RightController>();
  final controllerOpsList = Modular.get<OpslistController>();

  get sizeW => controllerGeral.size.width;

  get sizeH => controllerGeral.size.height;

  get showMenu => controllerGeral.showMenu;

  get header => controllerHeader.header(sizeW, hederHeight);

  get menu => controllerMenu.menuWidget(4);

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
  ObservableStream<List<OpsModel>> opsListRyobi;

  @action
  getOpsListRyob() {
    setStatus(PcpStatus.loading);
    opsListRyobi = repository.getOpsRyobi().asObservable();
    setStatus(PcpStatus.success);
  }

  @observable
  ObservableStream<List<OpsModel>> opsListSm2c;

  @action
  getOpsListSm2c() {
    setStatus(PcpStatus.loading);
    opsListSm2c = repository.getOpsSm2c().asObservable();
    setStatus(PcpStatus.success);
  }

  @observable
  ObservableStream<List<OpsModel>> opsListSm4c;

  @action
  getOpsListSm4c() {
    setStatus(PcpStatus.loading);
    opsListSm4c = repository.getOpsSm4c().asObservable();
    setStatus(PcpStatus.success);
  }

  @observable
  ObservableStream<List<OpsModel>> opsListFlexo;

  @action
  getOpsListFlexo() {
    setStatus(PcpStatus.loading);
    opsListFlexo = repository.getOpsFlexo().asObservable();
    setStatus(PcpStatus.success);
  }


  @observable
  bool buscando;

  @action
  setBuscando(bool valor){
    buscando = valor;
  }

//  @observable
//  ObservableStream<List<OpsModel>> opsListProd;
//
//  @observable
//  ObservableStream<List<OpsModel>> opsListEnt;
//
//  @action
//  getOpsListFiltro(){
//    try{
//      List<OpsModel> prod;
//      List<OpsModel> ent;
//      for(OpsModel op in opsListAll.data){
//        if(op.cancelada == false && op.produzido == null && op.entregue == null){
//          prod.add(op);
//        }else if(op.cancelada == false && op.produzido != null && op.entregue == null){
//          ent.add(op);
//        }
//      }
//    }catch(e){
//
//    }
//  }

  @observable
  PcpStatus status = PcpStatus.none;

  @action
  setStatus(PcpStatus statusOPS) {
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


  Future upImp(OpsModel model) => repository.upImp(model);
  Future upInfo(OpsModel model) => repository.upInfo(model);
  Future canProd(OpsModel model) => repository.canProd(model);
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
