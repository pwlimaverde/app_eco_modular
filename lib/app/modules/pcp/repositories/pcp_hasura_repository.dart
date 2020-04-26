import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:intl/intl.dart';
import 'documents/pcp_document.dart';
import 'pcp_interface.dart';

class PcpHasuraRepository implements IPcpRepository {

  final HasuraConnect connect;

  PcpHasuraRepository(this.connect);

  @override
  Future canProd(OpsModel model) async {
    connect.mutation(opsCanMutation,
        variables: {"op": model.op, "cancelada": !model.cancelada});
  }

  @override
  Future upImp(OpsModel model) async {
    var now = DateTime.now();
    final df = DateFormat('yyyy/MM/dd');
    try {
      connect.mutation(opsImpMutation,
          variables: {"op": model.op, "impressao": df.format(now), "ryobi": false, "sm4c": false, "sm2c": false, "flexo": false});
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<List<OpsModel>> getOpsRyobi() {
    return connect.subscription(opsRyobiQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsSm2c() {
    return connect.subscription(opsSm2cQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsSm4c() {
    return connect.subscription(opsSm4cQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsFlexo() {
    return connect.subscription(opsFlexoQuery).map((event) {
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
