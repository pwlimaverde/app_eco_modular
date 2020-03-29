import 'package:eco_web_mobx/app/modules/ops/widgets/right/right_widget.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'model/ops_model.dart';
import 'ops_controller.dart';
import 'widgets/listops/listops_widget.dart';
import 'widgets/listtilesize/listtilesize_widget.dart';

class OpsPage extends StatefulWidget {
  final String title;

  const OpsPage({Key key, this.title = "Ops"}) : super(key: key);

  @override
  _OpsPageState createState() => _OpsPageState();
}

class _OpsPageState extends ModularState<OpsPage, OpsController>
    with SingleTickerProviderStateMixin<OpsPage> {
  final controllerHeader = Modular.get<HeaderController>();
  final controllerMenu = Modular.get<MenuController>();

  TabController _tabController;

  bool get showMenu => controller.size.width <= 1080;

  double get sizeW => controller.size.width;

  double get sizeH => controller.size.height;

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
    return Scaffold(
      body: Column(
        children: <Widget>[
          controllerHeader.observerHeader(),
          _observerBody(),
        ],
      ),
    );
  }

  _tabBar() {
    return Container(
      height: 40,
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

  buildObserver() {
    return Observer(
      builder: (_) {
        List<OpsModel> list = controller.opsListAll.data;
        if (controller.opsListAll.hasError) {
          return Text("Teve um erro");
        }
        if (controller.opsListAll.data == null) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            OpsModel model = list[index];
            return ListTile(
              title: Text("Op: ${model.op} - Data: ${model.entrada}"),
            );
          },
        );
      },
    );
  }

  buildObserver2() {
    return Observer(
      builder: (_) {
        List<OpsModel> list = controller.opsListAll.data;
        if (controller.opsListAll.hasError) {
          return Text("Teve um erro");
        }
        if (controller.opsListAll.data == null) {
          return CircularProgressIndicator();
        }
        return _testelist2();
      },
    );
  }

  _observerBody() {
    controller.getQuery(context);
    return Observer(
      builder: (_) {
        return Container(
          width: sizeW,
          height: sizeH - hederHeight,
          child: Row(
            children: <Widget>[
              showMenu
                  ? _rightWidget()
                  : Row(
                      children: <Widget>[
                        controllerMenu.observerMenuWidget(),
                        _rightWidget(),
                      ],
                    )
            ],
          ),
        );
      },
    );
  }

  _rightWidget() {
    return RightWidget(
      list: buildObserver2(),
      tab: _tabBar(),
      menuWidth: menuWidth,
      showMenu: showMenu,
      sizeW: sizeW,
      controller: controller,
    );
  }

  _testelist2() {
    return ListopsWidget(
      menuWidth: menuWidth,
      showMenu: showMenu,
      sizeW: sizeW,
      filtro: controller.opsListAll.data,
      controller: controller,
      allOps: true,
    );
  }

  _testelist1(model) {
    return ListtilesizeWidget(
      controller: controller,
      sizeGeral: 700,
      sizeCont: 10,
      sizeFontTile: 2.2,
      sizeFontSubTile: 1.5,
      title: "OP: ${model.op}",
      subTile: "Entrada: ${model.entrada}",
    );
  }
}
