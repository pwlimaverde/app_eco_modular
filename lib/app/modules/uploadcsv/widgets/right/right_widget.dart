import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../model/ops_model.dart';

class RightWidget extends StatelessWidget {
  var menuWidth;
  var showMenu;
  var sizeW;
  var controller;

  RightWidget({this.menuWidth, this.showMenu, this.sizeW, this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.upandoOps == true) {
        return _buildContainer(_load());
      }
      if (controller.msgError != null) {
        return _buildContainer(Text("${controller.msgError}"));
      }
      if (controller.opsListUpload.isEmpty) {
        return _buildContainer(
            Text("colocar conteudo quando a Lista tiver vasia"));
      }
      return _buildContainer(_ListaUploadOps());
    });
  }

  _load() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildContainer(Widget child) {
    return Container(
      width: showMenu ? sizeW : sizeW - menuWidth,
      color: Colors.grey[200],
      child: Center(child: child),
    );
  }

  _ListaUploadOps() {
    return ListView.builder(
        itemCount: controller.opsListUpload.length,
        itemBuilder: (_, index) {
          OpsModel model = controller.opsListUpload[index];
          return _buildCheckboxListTile(model);
        });
  }

  _buildCheckboxListTile(OpsModel model) {
    return ListTile(
      title: Text(
          "Op: ${model.op} - ${model.cliente}"),
      subtitle: Text(model.servico),
    );
  }
}
