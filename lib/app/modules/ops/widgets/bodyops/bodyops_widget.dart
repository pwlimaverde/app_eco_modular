import 'package:eco_web_mobx/app/modules/ops/widgets/listops/listops_widget.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
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
          Tab(text: "Em Produção"),
          Tab(text: "Em Expedição"),
          Tab(text: "Todas as Ops"),
        ],
      ),
    );
  }

  _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        color(Colors.greenAccent),
        color(Colors.blue),
        _observerList(),
      ],
    );
  }

  color(Color color) {
    return Container(
      color: color,
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
          filtro,
          controller.upProd,
          controller.canProd,
        );
      },
    );
  }
}
