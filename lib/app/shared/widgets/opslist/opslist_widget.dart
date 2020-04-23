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
import 'opslist_controller.dart';

class OpslistWidget extends StatelessWidget {
  bool showMenu;
  final Function(OpsModel) check;
  final Function(OpsModel) can;
  final Function(OpsModel) save;
  List<OpsModel> filtro;

  OpslistWidget({this.showMenu, this.filtro, this.check, this.can, this.save});

  final controllerGeral = Modular.get<AppController>();
  final controller = Modular.get<OpslistController>();

  final f = DateFormat('dd/MM/yy');
  final fc = DateFormat('dd/MM/yyyy');
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
                  OpslisttileWidget(
                    heightT: 25,
                    heightS: 35,
                    sizeGeral: size,
                    sizeCont: 50,
                    sizeFontTile: 1.5,
                    sizeFontSubTile: 1.4,
                    line: 2,
                    alingL: true,
                    title:
                        "${o.cancelada == true ? cliente + " - OP CANCELADA" : o.entregue != null ? cliente + " - OP ENTREGUE" : o.produzido != null ? cliente + " - OP PRODUZIDA" : cliente} ${controller.getAtraso(o)}",
                    subTile:
                        "${o.servico.length >= 300 ? o.servico.substring(0, 300) : o.servico}",
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
                    labelT: "Entrega:",
                    title: f.format(o.entrega),
                    subTile:
                        "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
                    ontap: () {
//                      _showDialog(context, o);
                    },
                  ),
//                  CheckboxWidget(
//                    heightT: 25,
//                    sizeGeral: size,
//                    sizeCont: 10,
//                    sizeFontTile: 1.5,
//                    labelT: "Impressão:",
//                    title: "Ryobi",
//                    value: o.ryobi??false,
//                    onChanged: (check){
//                      o.ryobi = check;
//                      save(o);
//                    },
//                  ),
//                  Card(
//                    child: Container(
//                      width: 80,
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              Checkbox(
//                                value: o.ryobi??false,
//                                onChanged: (check){
//                                  o.ryobi = check;
//                                  save(o);
//                                },
//                              ),
//                              Text("Ryobi"),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 40,
                        child: Observer(builder: (_) {
                          if (controller.loadOpCheck == o.op) {
                            return CircularprogressWidget(
                              left: 0,
                              right: 0,
                              top: 14,
                              bottom: 14,
                              swidth: 14,
                              sheight: 14,
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
                        height: 40,
                        child: Observer(builder: (_) {
                          if (controller.loadOpCan == o.op) {
                            return CircularprogressWidget(
                              left: 0,
                              right: 0,
                              top: 14,
                              bottom: 14,
                              swidth: 14,
                              sheight: 14,
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

//  _showDialog(context, OpsModel model) {
//    showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            title: Text("Alterar dados"),
//            content: Column(
//              children: <Widget>[
//                TextFormField(
//                  initialValue: fc.format(model.entrega),
//                  onChanged: (value) {
//                    model.entrega = DateTime.parse(
//                        "${value.substring(6, 10)}-${value.substring(3, 5)}-${value.substring(0, 2)}");
//                  },
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      labelText: "Altere a data de Entrega"),
//                ),
//                TextFormField(
//                  initialValue: model.obs,
//                  onChanged: (value) => model.obs = value,
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      labelText: "Altere as Observações"),
//                ),
//              ],
//            ),
//            actions: <Widget>[
//              FlatButton(
//                onPressed: () {
//                  Modular.to.pop();
//                },
//                child: Text("Cancelar"),
//              ),
//              FlatButton(
//                onPressed: () {
//                  save(model);
//                  Modular.to.pop();
//                },
//                child: Text("Salvar"),
//              ),
//            ],
//          );
//        });
//  }
}
