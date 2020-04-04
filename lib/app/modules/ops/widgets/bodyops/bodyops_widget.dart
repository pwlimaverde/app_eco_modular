import 'package:eco_web_mobx/app/modules/ops/widgets/listops/listops_widget.dart';
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
        buildObserver2(),
        color(Colors.lightBlue),
      ],
    );
  }

  color(Color color) {
    return Container(
      color: color,
    );
  }

  buildObserver2() {
    return Observer(
      builder: (context) {
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

  _testelist2() {
    return ListopsWidget(
      menuWidth: menuWidth,
      showMenu: widget.showMenu,
      sizeW: widget.sizeW,
      allOps: true,
    );
  }

}

//  buildObserver() {
//    return Observer(
//      builder: (_) {
//        List<OpsModel> list = controller.opsListAll.data;
//        if (controller.opsListAll.hasError) {
//          return Text("Teve um erro");
//        }
//        if (controller.opsListAll.data == null) {
//          return CircularProgressIndicator();
//        }
//        return ListView.builder(
//          itemCount: list.length,
//          itemBuilder: (context, index) {
//            OpsModel model = list[index];
//            return ListTile(
//              title: Text("Op: ${model.op} - Data: ${model.entrada}"),
//            );
//          },
//        );
//      },
//    );
//  }



//  _observerBody() {
//    controller.getQuery(context);
//    return Observer(
//      builder: (_) {
//        return Container(
//          width: sizeW,
//          height: sizeH - hederHeight,
//          child: Row(
//            children: <Widget>[
//              showMenu
//                  ? _rightWidget()
//                  : Row(
//                children: <Widget>[
//                  controllerMenu.menuWidget(2),
//                  _rightWidget(),
//                ],
//              )
//            ],
//          ),
//        );
//      },
//    );
//  }

//  _rightWidget() {
//    return RightWidget(
//      list: buildObserver2(),
//      tab: _tabBar(),
//      menuWidth: menuWidth,
//      showMenu: showMenu,
//      sizeW: sizeW,
//      controller: controller,
//    );
//  }



//  _testelist1(model) {
//    return ListtilesizeWidget(
//      controller: controller,
//      sizeGeral: 700,
//      sizeCont: 10,
//      sizeFontTile: 2.2,
//      sizeFontSubTile: 1.5,
//      title: "OP: ${model.op}",
//      subTile: "Entrada: ${model.entrada}",
//    );
//  }
