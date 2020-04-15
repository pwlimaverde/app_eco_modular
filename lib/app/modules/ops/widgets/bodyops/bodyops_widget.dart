import 'package:eco_web_mobx/app/modules/ops/widgets/listops/listops_widget.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../ops_controller.dart';

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
  final controller = Modular.get<OpsController>();
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
    _tabController.index = await controller.prefsOps.getInt("tabIndex");
    _tabController.addListener(() {
      controller.prefsOps.setInt("tabIndex", _tabController.index);
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
          Tab(
            text: "Em Produção",
          ),
          Tab(
            text: "Em Expedição",
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
                        Text("Todas Ops"),
                        _iconButtonSearch(),
                      ],
                    ),
            );
          }),
        ],
      ),
    );
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
              },
            ),
          ),
        ],
      ),
    );
  }

  _buttonSearch() {
    return IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: () {
        controller.setBuscando(true);
      },
    );
  }

  _inkWell({Icon icon, String title, Function ontap, Color color}) {
    return InkWell(
      child: Row(
        children: <Widget>[
          icon,
          Text(
            title,
            style: TextStyle(color: color),
          ),
        ],
      ),
      onTap: ontap,
    );
  }

  _alertBusca() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Digite a Busca..."),
            content: _textFormField(),
            actions: <Widget>[
              FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    crtlBusca.clear();
                    controller.setBuscando(false);
                    Navigator.pop(context);
                  })
            ],
          );
        });
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
        _observerListProd(),
        _observerListEnt(),
        _observerList(),
      ],
    );
  }

  _observerList() {
    return Observer(
      builder: (context) {
        List<OpsModel> filtro = controller.opsListAll.data;
        if (controller.opsListAll.hasError) {
          return Text("Teve um erro");
        }
        if (controller.opsListAll.data == null) {
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
        );
      },
    );
  }

  _observerListProd() {
    return Observer(
      builder: (context) {
        List<OpsModel> filtro = controller.opsListProd.data;
        if (controller.opsListProd.hasError) {
          return Text("Teve um erro");
        }
        if (controller.opsListProd.data == null) {
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
        );
      },
    );
  }

  _observerListEnt() {
    return Observer(
      builder: (context) {
        List<OpsModel> filtro = controller.opsListEnt.data;
        if (controller.opsListEnt.hasError) {
          return Text("Teve um erro");
        }
        if (controller.opsListEnt.data == null) {
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
        );
      },
    );
  }
}
