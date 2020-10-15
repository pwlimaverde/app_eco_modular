import 'package:eco_web_mobx/app/modules/ops/repositories/documents/ops_document.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:intl/intl.dart';
import 'ops_interface.dart';

class OpsHasuraRepository implements IOpsRepository {
  final HasuraConnect connect;

  OpsHasuraRepository(this.connect);

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
      if (model.artefinal != null &&
          model.produzido != null &&
          model.entregue != null) {
        return;
      }
      if (model.artefinal == null) {
        print("inicio arte final");
        connect.mutation(opsArteFinalMutation,
            variables: {"op": model.op, "artefinal": df.format(now)});
        print("fim arte final");
      } else if (model.produzido == null) {
        connect.mutation(opsProdMutation,
            variables: {"op": model.op, "produzido": df.format(now)});
      } else {
        connect.mutation(opsEntMutation,
            variables: {"op": model.op, "entregue": df.format(now)});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<List<OpsModel>> getOpsAll() {
    return connect.subscription(opsAllQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsEnt() {
    return connect.subscription(opsEntQuery).map((event) {
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
  Stream<List<OpsModel>> getOpsProd() {
    return connect.subscription(opsProdQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Future upInfo(OpsModel model) {
    final df = DateFormat('yyyy/MM/dd');
    try {
      connect.mutation(opsInfoMutation, variables: {
        "op": model.op,
        "entrega": df.format(model.entrega),
        "entregaprog":
            model.entregaprog != null ? df.format(model.entregaprog) : null,
        "obs": model.obs,
        "ryobi": model.ryobi,
        "sm2c": model.sm2c,
        "sm4c": model.sm4c,
        "flexo": model.flexo,
        "impressao":
            model.impressao != null ? df.format(model.impressao) : null,
      });
    } catch (e) {
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
