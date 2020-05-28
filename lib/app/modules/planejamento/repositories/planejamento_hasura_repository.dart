
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:intl/intl.dart';
import 'documents/planejamento_document.dart';
import 'planejamento_interface.dart';

class PlanejamentoHasuraRepository implements IPlanejamentoRepository {
  final HasuraConnect connect;

  PlanejamentoHasuraRepository(this.connect);

  @override
  Future canProd(OpsModel model) async {
    connect.mutation(opsCanMutation,
        variables: {"op": model.op, "cancelada": !model.cancelada});
  }

  @override
  Future upProd(OpsModel model) async {
    var now = DateTime.now();
    final df = DateFormat('yyyy/MM/dd');
    try {
      if (model.designer != null && model.artefinal != null && model.estoque != null) {
        return;
      }
      if (model.designer == null) {
        print("inicio arte designer");
        connect.mutation(opsDesignerMutation,
            variables: {"op": model.op, "designer": df.format(now)});
        print("fim arte designer");
      }else if(model.artefinal == null){
        print("inicio arte final");
        connect.mutation(opsArteFinalMutation,
            variables: {"op": model.op, "artefinal": df.format(now)});
        print("fim arte final");
      }else{
        print("inicio arte estoque");
        connect.mutation(opsEstoqueFinalMutation,
            variables: {"op": model.op, "estoque": df.format(now)});
        print("fim arte estoque");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<List<OpsModel>> getOpsEstoque() {
    return connect.subscription(opsEstoqueQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsArteFinal() {
    return connect.subscription(opsArteFinalQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsDesigner() {
    return connect.subscription(opsDesignerQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Future upInfo(OpsModel model) {
    final df = DateFormat('yyyy/MM/dd');
    try{
      connect.mutation(opsInfoMutation, variables: {
        "op": model.op,
        "entrega": df.format(model.entrega),
        "entregaprog": model.entregaprog != null?df.format(model.entregaprog):null,
        "obs": model.obs,
        "ryobi": model.ryobi,
        "sm2c": model.sm2c,
        "sm4c": model.sm4c,
        "flexo": model.flexo,
        "impressao": model.impressao != null?df.format(model.impressao):null,
      });
    }catch (e){
      print("erro --- $e");
    }


//    try{
//      DocumentReference docRef = firestore.collection("ops").document("${model.op}");
//      DocumentSnapshot doc = await docRef.get();
//      model.reference.updateData({
//        'obs': model.obs,
//        'entrega': model.entrega,
//        'ryobi': model.ryobi,
//      });
//    }catch(e){
//      print(e);
//    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
