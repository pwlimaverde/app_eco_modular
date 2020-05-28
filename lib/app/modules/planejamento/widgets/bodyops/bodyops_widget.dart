import 'package:eco_web_mobx/app/modules/ops/widgets/listops/listops_widget.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../planejamento_controller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:printing/printing.dart';
import 'dart:html' as html;

class BodyopsWidget extends StatefulWidget {
  var menuWidth;
  var showMenu;
  var sizeW;
  var sizeH;

  BodyopsWidget({this.menuWidth, this.showMenu, this.sizeW, this.sizeH});

  @override
  _BodyopsWidgetState createState() => _BodyopsWidgetState();
}

class _BodyopsWidgetState extends State<BodyopsWidget>
    with SingleTickerProviderStateMixin<BodyopsWidget> {
  final controller = Modular.get<PlanejamentoController>();
  final formKey = GlobalKey<FormState>();
  final crtlBusca = TextEditingController();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  Future _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = await controller.prefsOps.getInt("planejamentotabIndex");
    _tabController.addListener(() {
      controller.prefsOps.setInt("planejamentotabIndex", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildContainer(_body());
  }

  _buildContainer(Widget child, {bool tab}) {
    return Container(
      width: widget.showMenu ? widget.sizeW : widget.sizeW - widget.menuWidth,
      height: tab == true
          ? widget.sizeH - hederHeight - tabHeight
          : widget.sizeH - hederHeight,
      color: Colors.grey[200],
      child: Center(child: child),
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        _tabBar(),
        _buildContainer(
          _tabBarView(),
          tab: true,
        ),
      ],
    );
  }

  _tabBar() {
    return Container(
      height: tabHeight,
      color: Colors.grey[700],
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.white,
        indicatorColor: Colors.blue,
        labelStyle: TextStyle(color: Colors.white, fontSize: 13),
        tabs: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buttonPdf(),
              Text("Liberação Designer"),
              Text(""),
            ],
          ),
          Tab(
            text: "Liberação Arte Final",
          ),
          Observer(builder: (_) {
            return Tab(
//            text: "Todas as Ops",
              child: controller.buscando == true
                  ? _iconButtonSearch()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(""),
                        Text("Liberação Estoque"),
                        _iconButtonSearch(),
                      ],
                    ),
            );
          }),
        ],
      ),
    );
  }

  _buttonPdf() {
    return IconButton(
      iconSize: 18,
      icon: Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      onPressed: () => _generatePdf(context),
    );
  }

  _generatePdf(context) async {
//    final pdf = pdfLib.Document();
//    pdf.addPage(pdfLib.Page(
//        pageFormat: PdfPageFormat.a4,
//        build: (pdfLib.Context context) {
//          return pdfLib.Center(
//            child: pdfLib.Text("Hello World"),
//          ); // Center
//        }));

//    await Printing.layoutPdf(
//        onLayout: (PdfPageFormat format) async => await Printing.convertHtml(
//          format: format,
//          html: '<html><body><p>Hello!</p></body></html>',
//        ));
  }

  _iconButtonSearch() {
    return Observer(
      builder: (context) {
        return controller.buscando == true ? _buttonLimpar() : _buttonSearch();
      },
    );
  }

  _buttonLimpar() {
    return Container(
      width: 130,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            width: 110,
            height: 30,
            child: _textFormField(),
          ),
          Container(
            padding: EdgeInsets.all(0),
            width: 20,
            height: 30,
            child: IconButton(
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.clear,
                color: Colors.red,
                size: 20,
              ),
              onPressed: () {
                crtlBusca.clear();
                controller.setBuscando(false);
                controller.busca = null;
              },
            ),
          ),
        ],
      ),
    );
  }

  _buttonSearch() {
    return IconButton(
      iconSize: 18,
      icon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: () {
        controller.setBuscando(true);
      },
    );
  }

  _textFormField() {
    return TextFormField(
      autofocus: true,
      controller: crtlBusca,
      onChanged: (value) {
        controller.busca = value;
        controller.setBuscando(true);
      },
      style: TextStyle(fontSize: 15, color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
          labelText: "Busca",
          labelStyle: TextStyle(color: Colors.white),
          hintText: "Digite a busca",
          hintStyle: TextStyle(fontSize: 10, color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          )),
    );
  }

  _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        _observerListLibDesigner(),
        _observerListLibArteFinal(),
        _observerListLibEstoque(),
      ],
    );
  }

  _observerListLibEstoque() {
    return Observer(
      builder: (context) {
        List<OpsModel> filtro = controller.libEstoqueList.data;
        if (controller.libEstoqueList.hasError) {
          return Text("Teve um erro");
        }
        if (controller.libEstoqueList.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        return controller.controllerOpsList.opslistWidget(
          widget.showMenu,
          controller.buscando == true
              ? controller.busca != null && controller.busca.length >= 1
                  ? filtro.where(
                      (element) {
                        String termos =
                            "${element.op} - ${element.cliente} - ${element.servico} - ${element.quant} - ${element.vendedor} - ${element.obs}";
                        return termos
                            .toLowerCase()
                            .contains(controller.busca.toLowerCase());
                      },
                    ).toList()
                  : filtro
              : filtro,
          controller.upProd,
          controller.canProd,
          controller.upInfo,
          false,
        );
      },
    );
  }

  _observerListLibDesigner() {
    return Observer(
      builder: (context) {
        List<OpsModel> filtro = controller.libDesignerList.data;
        if (controller.libDesignerList.hasError) {
          return Text("Teve um erro");
        }
        if (controller.libDesignerList.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        return controller.controllerOpsList.opslistWidget(
          widget.showMenu,
          controller.buscando == true
              ? controller.busca != null && controller.busca.length >= 1
                  ? filtro.where(
                      (element) {
                        String termos =
                            "${element.op} - ${element.cliente} - ${element.servico} - ${element.quant} - ${element.vendedor} - ${element.obs}";
                        return termos
                            .toLowerCase()
                            .contains(controller.busca.toLowerCase());
                      },
                    ).toList()
                  : filtro
              : filtro,
          controller.upProd,
          controller.canProd,
          controller.upInfo,
          false,
        );
      },
    );
  }

  _observerListLibArteFinal() {
    return Observer(
      builder: (context) {
        List<OpsModel> filtro = controller.libArteFinalList.data;
        if (controller.libArteFinalList.hasError) {
          return Text("Teve um erro");
        }
        if (controller.libArteFinalList.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        return controller.controllerOpsList.opslistWidget(
          widget.showMenu,
          controller.buscando == true
              ? controller.busca != null && controller.busca.length >= 1
                  ? filtro.where(
                      (element) {
                        String termos =
                            "${element.op} - ${element.cliente} - ${element.servico} - ${element.quant} - ${element.vendedor} - ${element.obs}";
                        return termos
                            .toLowerCase()
                            .contains(controller.busca.toLowerCase());
                      },
                    ).toList()
                  : filtro
              : filtro,
          controller.upProd,
          controller.canProd,
          controller.upInfo,
          false,
        );
      },
    );
  }
}
