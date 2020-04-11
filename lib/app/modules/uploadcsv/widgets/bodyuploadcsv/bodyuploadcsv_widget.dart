import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../uploadcsv_controller.dart';
import '../../uploadcsv_status.dart';

class BodyuploadcsvWidget extends StatelessWidget {

  var menuWidth;
  var showMenu;
  var sizeW;
  var sizeH;

  BodyuploadcsvWidget({this.menuWidth, this.showMenu, this.sizeW, this.sizeH});

  final controller = Modular.get<UploadcsvController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _rightUpload(),
    );
  }


  _rightUpload() {
    return Observer(builder: (context) {
      if (controller.status == UploadcsvStatus.none) {
        return _buildContainer(
            Text("colocar conteudo geral"));
      } else if (controller.status == UploadcsvStatus.loading) {
        return _buildContainer(_load());
      } else if (controller.status == UploadcsvStatus.success) {
        UploadcsvStatus statusRight = controller.status;
        final list = statusRight.valorGet as List<OpsModel>;
        return _buildContainer(_ListaUploadOps(list));
      } else {
        UploadcsvStatus statusRight = controller.status;
        return _buildContainer(Text("${statusRight.valorGet}"));
      }
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
      height: sizeH - hederHeight,
      color: Colors.grey[200],
      child: Center(child: child),
    );
  }

  _ListaUploadOps(List<OpsModel> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          OpsModel model = list[index];
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