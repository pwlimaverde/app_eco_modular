import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../app_controller.dart';
import 'components/opslisttile/opslisttile_widget.dart';

class OpslistWidget extends StatelessWidget {

  bool showMenu;
//  bool upProd;
//  bool allOps;
  List<OpsModel> filtro;

  OpslistWidget({
    this.showMenu,
    this.filtro
  });

  final controller = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return _listOpsProdL(context);
  }

  _listOpsProdL(context) {
    controller.getQuery(context);
//    if (!showMenu) {
    return Container(
      padding: EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: filtro != null
            ? filtro.length
            : 0,
        itemBuilder: (context, index) {
          OpsModel o = filtro[index];
          double size = controller.getQueryMed(context, 100, showMenu);
//            bool upProd = controller.upProd ?? false;
//            bool allOps = controller.allOps ?? false;
//          bool crt = false;
//          bool can = false;
          return Card(
            child: Container(
              width: size,
              child: Row(
                children: <Widget>[
                  OpslisttileWidget(
                    sizeGeral: size,
                    sizeCont: 10,
                    sizeFontTile: 2.2,
                    sizeFontSubTile: 1.5,
                    title: "OP: ${o.op}",
                    subTile: "Entrada: ${o.entrada}",
                  ),
                  OpslisttileWidget(
                    threeLine: true,
                    line: 3,
                    sizeGeral: size,
                    sizeCont: 58,
                    sizeFontTile: 2.2,
                    sizeFontSubTile: 1.5,
                    title:
                    "Cliente: ${o.cancelada == false ? o.cliente.length >= 35 ? o.cliente.substring(0, 35) : o.cliente : o.cliente.length >= 25 ? o.cliente.substring(0, 25) + " - OP CANCELADA" : o.cliente + " - OP CANCELADA"}",
                    subTile:
                    "${o.servico.length >= 150 ? o.servico.substring(0, 150) : o.servico}",
                  ),
                  OpslisttileWidget(
                    sizeGeral: size,
                    sizeCont: 10,
                    sizeFontTile: 2,
                    sizeFontSubTile: 1.5,
                    title: "QT: ${o.quant}",
                    subTile:
                    "Vend: ${o.vendedor.length >= 8 ? o.vendedor.substring(0, 8) : o.vendedor}",
                  ),
                  OpslisttileWidget(
                    threeLine: true,
                    line: 3,
                    sizeGeral: size,
                    sizeCont: 15,
                    sizeFontTile: 2.2,
                    sizeFontSubTile: 1.5,
                    title: "Entrega: ${o.entrega}",
                    subTile:
                    "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
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
                mainAxisAlignment: MainAxisAlignment.center,
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

}

