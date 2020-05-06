import 'dart:html';

import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../../../app_controller.dart';
import 'components/checkbox/checkbox_widget.dart';
import 'components/circularprogress/circularprogress_widget.dart';
import 'components/iconbutton/iconbutton_widget.dart';
import 'components/opslisttile/opslisttile_widget.dart';
import 'components/switcher/switcher_widget.dart';
import 'opslist_controller.dart';

class OpslistWidget extends StatelessWidget {
  bool showMenu;
  final Function(OpsModel) check;
  final Function(OpsModel) can;
  final Function(OpsModel) save;
  bool up = false;
  List<OpsModel> filtro;

  OpslistWidget({this.showMenu, this.filtro, this.check, this.can, this.save, this.up});

  final controllerGeral = Modular.get<AppController>();
  final controller = Modular.get<OpslistController>();

  var now = DateTime.now();
  final f = DateFormat('dd/MM/yy');
  final f2 = DateFormat('dd/MM');
  final fc = DateFormat('dd/MM/yyyy');
  final df = DateFormat('yyyy/MM/dd');
  final numMilhar = NumberFormat(",##0", "pt_BR");

  @override
  Widget build(BuildContext context) {
    return _listOpsProdL(context);
  }

  _listOpsProdL(context) {
    controllerGeral.getQuery(context);
//    if (!showMenu) {
    return Container(
      padding: EdgeInsets.all(4),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filtro != null ? filtro.length : 0,
        itemBuilder: (context, index) {
          OpsModel o = filtro[index];
          double size = controllerGeral.getQueryMed(context, 100, showMenu);
          String cliente =
              o.cliente.length >= 35 ? o.cliente.substring(0, 35) : o.cliente;
          return Card(
            color: controller.getCorCard(o),
            child: Container(
              width: size,
              child: Row(
                children: <Widget>[
                  OpslisttileWidget(
                    heightT: 25,
                    heightS: 35,
                    sizeGeral: size,
                    sizeCont: 10,
                    sizeFontTile: 1.8,
                    sizeFontSubTile: 1.5,
                    labelT: "OP:",
                    title: "${o.op}",
                    labelS: "Entrada:",
                    subTile: f.format(o.entrada),
                  ),
                  Expanded(
                    child: OpslisttileWidget(
                      cardAux: true,
                      heightT: 25,
                      heightS: 35,
                      sizeGeral: size,
                      sizeCont: 65,
                      sizeFontTile: 1.5,
                      sizeFontSubTile: 1.4,
                      line: 2,
                      alingL: true,
                      title:
                          "${o.cancelada == true ? cliente + " - OP CANCELADA" : o.entregue != null ? cliente + " - OP ENTREGUE" : o.produzido != null ? cliente + " - OP PRODUZIDA" : cliente} ${controller.getAtraso(o)} ${o.impressao != null ? " - Impresso" : ""}",
                      subTile:
                          "${o.servico.length >= 300 ? o.servico.substring(0, 300) : o.servico}",
                    ),
                  ),
                  OpslisttileWidget(
                    heightT: 25,
                    heightS: 35,
                    sizeGeral: size,
                    sizeCont: 10,
                    sizeFontTile: 1.8,
                    sizeFontSubTile: 1.5,
                    labelT: "QT:",
                    title: "${numMilhar.format(o.quant)}",
                    labelS: "Vend:",
                    subTile:
                        "${o.vendedor.length >= 12 ? o.vendedor.substring(0, 12) : o.vendedor}",
                  ),
                  OpslisttileWidget(
                    heightT: 25,
                    heightS: 35,
                    sizeGeral: size,
                    sizeCont: 10,
                    sizeFontTile: 1.5,
                    sizeFontSubTile: 1.2,
                    line: 2,
                    labelT: o.entregaprog != null
                        ? "Ini ${f2.format(o.entregaprog)}:"
                        : "Entrega:",
                    title: f.format(o.entrega),
                    subTile:
                        "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
                    ontap: () {
                      _showDialog(context, o);
                    },
                  ),
                  up == false ? Card(
                    elevation: 0.5,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      width: 75,
                      height: 72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SwitcherWidget(
                            imp: o.impressao,
                            title: "Ryobi ",
                            crtL: o.ryobi,
                            mini: true,
                            onTap: () {
                              o.ryobi = o.impressao != null ? false : !o.ryobi;
                              save(o);
                            },
                          ),
                          SwitcherWidget(
                            imp: o.impressao,
                            title: "SM 4c ",
                            crtL: o.sm4c,
                            mini: true,
                            onTap: () {
                              o.sm4c = o.impressao != null ? false : !o.sm4c;
                              save(o);
                            },
                          ),
                          SwitcherWidget(
                            imp: o.impressao,
                            title: "SM 2c ",
                            crtL: o.sm2c,
                            mini: true,
                            onTap: () {
                              o.sm2c = o.impressao != null ? false : !o.sm2c;
                              save(o);
                            },
                          ),
                          SwitcherWidget(
                            imp: o.impressao,
                            title: "Flexo ",
                            crtL: o.flexo,
                            mini: true,
                            onTap: () {
                              o.flexo = o.impressao != null ? false : !o.flexo;
                              save(o);
                            },
                          ),
                        ],
                      ),
                    ),
                  ):Container(),
                  Card(
                    elevation: 0.5,
                    child: Container(
                      width: 30,
                      height: 72,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 31,
                            child: Observer(builder: (_) {
                              if (controller.loadOpCheck == o.op) {
                                return CircularprogressWidget(
                                  left: 0,
                                  right: 0,
                                  top: 12,
                                  bottom: 12,
                                  swidth: 12,
                                  sheight: 12,
                                  strok: 2,
                                  color: Colors.green,
                                );
                              } else {
                                return IconbuttonWidget(
                                  icon: Icons.check,
                                  color: Colors.green,
                                  onPressed: () {
                                    check(o);
                                  },
                                );
                              }
                            }),
                          ),
                          Container(
                            height: 41,
                            child: Observer(builder: (_) {
                              if (controller.loadOpCan == o.op) {
                                return CircularprogressWidget(
                                  left: 0,
                                  right: 0,
                                  top: 12,
                                  bottom: 12,
                                  swidth: 12,
                                  sheight: 12,
                                  strok: 2,
                                  color: Colors.red,
                                );
                              } else {
                                return IconbuttonWidget(
                                  icon: Icons.cancel,
                                  color: Colors.red,
                                  onPressed: () {
                                    can(o);
                                  },
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),

//                    Container(
//                      width: controller.getSize(size, 3),
//                      child: allOps == false
//                          ? Column(
//                              children: <Widget>[
//                                ObserverbuttonWidget(
//                                  upProd: upProd,
//                                  crt: crt,
//                                  model: o,
//                                  color: Colors.green,
//                                  icon: Icons.check,
//                                  controller: controller,
//                                ),
//                                ObserverbuttonWidget(
//                                  upProd: upProd,
//                                  crt: can,
//                                  model: o,
//                                  color: Colors.red,
//                                  icon: Icons.clear,
//                                  controller: controller,
//                                  cancelarOP: true,
//                                ),
//                              ],
//                            )
//                          : Column(
//                              children: <Widget>[
//                                o.cancelada == false
//                                    ? ObserverbuttonWidget(
//                                        crt: can,
//                                        model: o,
//                                        color: Colors.red,
//                                        icon: Icons.clear,
//                                        controller: controller,
//                                        cancelarOP: true,
//                                      )
//                                    : ObserverbuttonWidget(
//                                        crt: can,
//                                        model: o,
//                                        color: Colors.green,
//                                        icon: Icons.settings_backup_restore,
//                                        controller: controller,
//                                        cancelarOP: true,
//                                        reativarOP: true,
//                                      ),
//                              ],
//                            ),
//                    ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          );
        },
      ),
    );
//    }
//    return Container(
//      padding: EdgeInsets.all(12),
//      child: ListView.builder(
//        itemCount: filtro != null ? filtro.length : 0,
//        itemBuilder: (context, index) {
//          OpsModel o = filtro[index];
//          var size = controller.getQueryMed(context, 70, showMenu);
//          bool crt = false;
//          bool can = false;
//          return Card(
//            child: Container(
//              width: size,
//              child: Row(
//                children: <Widget>[
//                  ListtilesizeWidget(
//                    controller: controller,
//                    sizeGeral: size,
//                    sizeCont: 14,
//                    sizeFontTile: 3.5,
//                    sizeFontSubTile: 2.5,
//                    title: "${o.op}",
//                    subTile: "${o.entrada}",
//                  ),
//                  ListtilesizeWidget(
//                    controller: controller,
//                    threeLine: true,
//                    line: 3,
//                    sizeGeral: size,
//                    sizeCont: 40,
//                    sizeFontTile: 3.5,
//                    sizeFontSubTile: 2.5,
//                    title:
//                        "${o.cancelada == false ? o.cliente.length >= 35 ? o.cliente.substring(0, 35) : o.cliente : o.cliente.length >= 25 ? o.cliente.substring(0, 25) + " - OP CANCELADA" : o.cliente + " - OP CANCELADA"}",
//                    subTile:
//                        "${o.servico.length >= 150 ? o.servico.substring(0, 150) : o.servico}",
//                  ),
//                  ListtilesizeWidget(
//                    controller: controller,
//                    sizeGeral: size,
//                    sizeCont: 15,
//                    sizeFontTile: 3.5,
//                    sizeFontSubTile: 2.5,
//                    title: "${o.quant}",
//                    subTile:
//                        "${o.vendedor.length >= 8 ? o.vendedor.substring(0, 8) : o.vendedor}",
//                  ),
//                  ListtilesizeWidget(
//                    controller: controller,
//                    threeLine: true,
//                    line: 3,
//                    sizeGeral: size,
//                    sizeCont: 18,
//                    sizeFontTile: 3.5,
//                    sizeFontSubTile: 2.5,
//                    title: "Ent: ${o.entrega}",
//                    subTile:
//                        "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
//                  ),
//                  Container(
//                    width: controller.getSize(size, 3),
//                    child: allOps == false
//                        ? Column(
//                            children: <Widget>[
//                              ObserverbuttonWidget(
//                                upProd: upProd,
//                                crt: crt,
//                                model: o,
//                                color: Colors.green,
//                                icon: Icons.check,
//                                controller: controller,
//                              ),
//                              ObserverbuttonWidget(
//                                upProd: upProd,
//                                crt: can,
//                                model: o,
//                                color: Colors.red,
//                                icon: Icons.clear,
//                                controller: controller,
//                                cancelarOP: true,
//                              ),
//                            ],
//                          )
//                        : Column(
//                            children: <Widget>[
//                              o.cancelada == false
//                                  ? ObserverbuttonWidget(
//                                      crt: can,
//                                      model: o,
//                                      color: Colors.red,
//                                      icon: Icons.clear,
//                                      controller: controller,
//                                      cancelarOP: true,
//                                    )
//                                  : ObserverbuttonWidget(
//                                      crt: can,
//                                      model: o,
//                                      color: Colors.green,
//                                      icon: Icons.settings_backup_restore,
//                                      controller: controller,
//                                      cancelarOP: true,
//                                      reativarOP: true,
//                                    ),
//                            ],
//                          ),
//                  ),
//                ],
//                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.center,
//              ),
//            ),
//          );
//        },
//      ),
//    );
  }

  _showDialog(context, OpsModel model) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alterar dados da OP: ${model.op}"),
            content: Container(
              width: 370,
              height: 120,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(3),
                        width: 50,
                        height: 60,
                        child: TextFormField(
                          initialValue: model.orderpcp != null ? model.orderpcp.toString():null,
                          onChanged: (value) => model.orderpcp = int.parse(value),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "N°"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        width: 110,
                        height: 60,
                        child: TextFormField(
                          initialValue: fc.format(model.entrega),
                          onChanged: (value) {
                            model.entregaprog =
                            model.entregaprog != null ? model.entregaprog : value != null ? model.entrega : null;
                            model.entrega = value != null
                                ? DateTime.parse(
                                    "${value.substring(6, 10)}-${value.substring(3, 5)}-${value.substring(0, 2)}")
                                : model.entrega;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Entrega"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        width: 210,
                        height: 60,
                        child: TextFormField(
                          initialValue: model.obs,
                          onChanged: (value) => model.obs = value,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Altere as Observações"),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    width: 370,
                    height: 60,
                    child: Observer(builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SwitcherWidget(
                                imp: model.impressao,
                                title: "Ryobi ",
                                crtL: model.ryobi,
                                crtC: controller.colorCrtRyobi,
                                onTap: () {
                                  controller.setColorCrtRyobi(
                                      model.impressao != null
                                          ? false
                                          : !model.ryobi);
                                  model.ryobi = model.impressao != null
                                      ? false
                                      : !model.ryobi;
                                  save(model);
                                },
                              ),
                              SwitcherWidget(
                                imp: model.impressao,
                                title: "SM 4 cor ",
                                crtL: model.sm4c,
                                crtC: controller.colorCrtSm4c,
                                onTap: () {
                                  controller.setColorCrtSm4c(model.impressao != null
                                      ? false
                                      : !model.sm4c);
                                  model.sm4c =
                                      model.impressao != null ? false : !model.sm4c;
                                  save(model);
                                },
                              ),
                              SwitcherWidget(
                                imp: model.impressao,
                                title: "SM 2 cor ",
                                crtL: model.sm2c,
                                crtC: controller.colorCrtSm2c,
                                onTap: () {
                                  controller.setColorCrtSm2c(model.impressao != null
                                      ? false
                                      : !model.sm2c);
                                  model.sm2c =
                                      model.impressao != null ? false : !model.sm2c;
                                  save(model);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SwitcherWidget(
                                imp: model.impressao,
                                title: "Flexo ",
                                crtL: model.flexo,
                                crtC: controller.colorCrtFlexo,
                                onTap: () {
                                  controller.setColorCrtFlexo(
                                      model.impressao != null
                                          ? false
                                          : !model.flexo);
                                  model.flexo = model.impressao != null
                                      ? false
                                      : !model.flexo;
                                  save(model);
                                },
                              ),
                              SwitcherWidget(
                                impOK: true,
                                imp: model.impressao,
                                title: "Impresso ",
                                crtC: controller.colorCrtImp,
                                onTap: () {
                                  controller.setColorCrtImp(
                                      model.impressao != null
                                          ? false
                                          : true);
//                              model.impressao = model.impressao != null
//                                  ? null
//                                  : now;
                                  if(model.impressao != null){
                                    model.impressao = null;
                                  }else{
                                    model.impressao = now;
                                    model.ryobi = false;
                                    model.sm2c = false;
                                    model.sm4c = false;
                                    model.flexo = false;
                                  }
                                  save(model);
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  controller.setColorCrtRyobi(false);
                  controller.setColorCrtSm4c(false);
                  controller.setColorCrtSm2c(false);
                  controller.setColorCrtFlexo(false);
                  Modular.to.pop();
                },
                child: Text("Cancelar"),
              ),
              FlatButton(
                onPressed: () {
                  save(model);
                  controller.setColorCrtRyobi(false);
                  controller.setColorCrtSm4c(false);
                  controller.setColorCrtSm2c(false);
                  controller.setColorCrtFlexo(false);
                  Modular.to.pop();
                },
                child: Text("Salvar"),
              ),
            ],
          );
        });
  }
}
