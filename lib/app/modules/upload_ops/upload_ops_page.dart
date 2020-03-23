import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_controller.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:firebase/firestore.dart';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'upload_ops_controller.dart';
import 'upload_ops_module.dart';

class UploadOpsPage extends StatefulWidget {
  final String title;

  const UploadOpsPage({Key key, this.title = "UploadOps"}) : super(key: key);

  @override
  _UploadOpsPageState createState() => _UploadOpsPageState();
}

class _UploadOpsPageState
    extends ModularState<UploadOpsPage, UploadOpsController> {
  //use 'controller' variable to access controller

  final controller = UploadOpsModule.to.get<UploadOpsController>();

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
          StreamBuilder(
            stream: controller.streamOps,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Deu erro => ${snapshot.error}");
              }
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<DocumentSnapshot> docs = snapshot.data;
//              List<OpsModel> ops = _getOps2(docs);
              return Container(
                height: 400,
                width: 600,
                child: ListView.builder(
                  itemCount: docs.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    OpsModel ops = OpsModel.fromDocument(docs[index]);
                    return Text("OP: ${ops.op}");
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

_getOps2(List<DocumentSnapshot> docs){
  List<OpsModel> ops = [];
  for(DocumentSnapshot doc in docs){
    OpsModel op = OpsModel.fromDocument(doc);
    String teste = doc.data().toString();
    String teste2 = doc.ref.id;
    print("ref _getOps: $teste2");
    print("all _getOps: $teste");
    print("OP _getOps: ${op.reference.id}");
    print("OP _getOps: ${op.op}");
    print("CLIENTE _getOps: ${op.cliente}");
    print("SERVIÇO _getOps: ${op.servico}");
    ops.add(op);
  }
  return ops;
}
