import 'package:eco_web_mobx/app/modules/uploadcsv/repositories/uploadcsv_interface.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:intl/intl.dart';

import 'documents/uploadops_document.dart';

class UploadcsvHasuraRepository implements IUploadcsvRepository {
  final HasuraConnect connect;

  UploadcsvHasuraRepository(this.connect);

  @override
  Future canProd(OpsModel model) async{
    connect.mutation(opsCanMutation, variables: {"op": model.op, "cancelada": !model.cancelada});
  }

  @override
  Future upProd(OpsModel model) async{
    var now = DateTime.now();
    final df = DateFormat('yyyy/MM/dd');
    try{
      if(model.produzido != null && model.entregue != null){
        return;
      }
      if(model.produzido == null){
        connect.mutation(opsProdMutation, variables: {"op": model.op, "produzido": df.format(now)});
      }else{
        connect.mutation(opsEntMutation, variables: {"op": model.op, "entregue": df.format(now)});
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Future upInfo(OpsModel model) {
    throw UnimplementedError();
  }

  @override
  Future upload(List<OpsModel> listOps) async {
    final df = DateFormat('yyyy/MM/dd');
    List<OpsModel> listOpsAnalitic = listOps;
    List<OpsModel> listOpsUP = [];
    List<OpsModel> listOpsUPOk = [];

    for (OpsModel model in listOpsAnalitic) {
      var query = await connect.query(opsDup, variables: {"op": model.op});
      var lDup = (query['data']['ops'] as List).length;
      if (lDup == 0) {
        listOpsUP.add(model);
      }
    }

    if (listOpsUP.length > 0) {
      for (OpsModel model in listOpsUP) {
        var data = await connect.mutation(
          uploadOpsMutation,
          variables: {
            "cliente": model.cliente,
            "op": model.op,
            "orcamento": model.orcamento,
            "quant": model.quant,
            "servico": model.servico,
            "valor": model.valor,
            "vendedor": model.vendedor,
            "entrada": df.format(model.entrada),
            "entrega": df.format(model.entrega),
          },
        );
        model.id = data['data']['insert_ops']['returning'][0]['id'];
        model.cancelada = false;
        model.produzido = null;
        model.entregue = null;
        listOpsUPOk.add(model);

      }
    }
    return listOpsUPOk.length > 0 ? listOpsUPOk : null;
  }

  @override
  void dispose() {}
}
