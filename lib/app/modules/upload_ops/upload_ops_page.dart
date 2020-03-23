import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_controller.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'upload_ops_controller.dart';

class UploadOpsPage extends StatefulWidget {
  final String title;

  const UploadOpsPage({Key key, this.title = "UploadOps"}) : super(key: key);

  @override
  _UploadOpsPageState createState() => _UploadOpsPageState();
}

class _UploadOpsPageState
    extends ModularState<UploadOpsPage, UploadOpsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text("Upload"),
              onPressed: () => controller.uploadOps(context),
            ),
          ),
          Observer(builder: (_) {

            if (controller.opsList.hasError) {
              return Center(
                child: RaisedButton(
                  onPressed: controller.getOpsList(),
                  child: Text("Erro"),
                ),
              );
            }

            if (controller.opsList.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<OpsModel> ops = controller.opsList.data;

            return Container(
              width: 800,
              height: 200,
              child: ListView.builder(
                  itemCount: ops.length,
                  itemBuilder: (_, index) {
                    OpsModel model = ops[index];
                    return buildCheckboxListTile(model);
                  }),
            );
          }),
        ],
      ),
    );
  }

  buildCheckboxListTile(OpsModel model) {
    return CheckboxListTile(
                  title: Text("Op: ${model.op} - ${model.cliente} - ${model.reference.id}"),
                  subtitle: Text(model.servico),
                  value: model.produzido,
                  onChanged: (check){
                    model.produzido = check;
                  },
                );
  }

//  StreamBuilder buildStreamBuilder() {
//    return StreamBuilder(
//      stream: controller.streamOps,
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//          return Text("Deu erro => ${snapshot.error}");
//        }
//        if (!snapshot.hasData) {
//          return Center(
//            child: CircularProgressIndicator(),
//          );
//        }
//        List<DocumentSnapshot> docs = snapshot.data;
////              List<OpsModel> ops = _getOps2(docs);
//        return Container(
//          height: 400,
//          width: 600,
//          child: ListView.builder(
//            itemCount: docs.length,
//            scrollDirection: Axis.vertical,
//            itemBuilder: (context, index) {
//              OpsModel ops = OpsModel.fromDocument(docs[index]);
//              return Text("OP: ${ops.op}");
//            },
//          ),
//        );
//      },
//    );
//  }
}

//_getOps2(List<DocumentSnapshot> docs) {
//  List<OpsModel> ops = [];
//  for (DocumentSnapshot doc in docs) {
//    OpsModel op = OpsModel.fromDocument(doc);
//    String teste = doc.data().toString();
//    String teste2 = doc.ref.id;
//    print("ref _getOps: $teste2");
//    print("all _getOps: $teste");
//    print("OP _getOps: ${op.reference.id}");
//    print("OP _getOps: ${op.op}");
//    print("CLIENTE _getOps: ${op.cliente}");
//    print("SERVIÇO _getOps: ${op.servico}");
//    ops.add(op);
//  }
//  return ops;
//}
