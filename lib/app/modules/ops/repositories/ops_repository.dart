import 'package:cloud_firestore/cloud_firestore.dart';
import 'ops_interface.dart';
import '../model/ops_model.dart';


class OpsRepository implements IOpsRepository {

  final Firestore firestore;
  OpsRepository(this.firestore);


//  @override
//  Future upEnt(OpsModel model) {
//    try{
//      model.reference.updateData({
//        'entregue': model.entregue,
//      });
//    }catch(e){
//      print(e);
//    }
//  }

  @override
  Future canProd(OpsModel model) {
    try{
      model.reference.updateData({
        'cancelada': true,
      });
    }catch(e){
      print(e);
    }
  }
//
//  @override
//  Future atProd(OpsModel model) {
//    try{
//      model.reference.updateData({
//        'cancelada': false,
//      });
//    }catch(e){
//      print(e);
//    }
//  }

  @override
  Stream<List<OpsModel>> getOpsAll() {
    return firestore.collection("ops").snapshots().map((query) {
      return query.documents.map((doc) {
        return OpsModel.fromDocument(doc);
      }).toList();
    });
  }

//  @override
//  Future upload(List<OpsModel> listOps) async{
//    List<OpsModel> listOpsAnalitic = listOps;
//    List<OpsModel> listOpsUP = [];
//
//    for(OpsModel model in listOps){
//      DocumentReference docRef = firestore.collection("ops").document("${model.op}");
//      DocumentSnapshot doc = await docRef.get();
//      final exists = doc.exists;
//      if(!exists){
//        listOpsUP.add(model);
//        print("Ops nova - ${model.op}");
//      }
//    }
//
//    if(listOpsUP.length > 0){
//      for(OpsModel model in listOpsUP){
//        firestore.collection("ops").document("${model.op}").setData({
//          'cliente': model.cliente,
//          'entrada': model.entrada,
//          'entrega': model.entrega,
//          'op': model.op,
//          'orcamento': model.orcamento,
//          'produzido': model.produzido,
//          'quant': model.quant,
//          'servico': model.servico,
//          'valor': model.valor,
//          'vendedor': model.vendedor,
//          'entregue': model.entregue,
//          'cancelada': model.cancelada,
//          'obs': model.obs,
//        });
//        print("Op cadastrada - ${model.op}");
//      }
//    }
//    print("total listOpsUP - ${listOpsUP.length}");
//    print("total listOpsAnalitic - ${listOpsAnalitic.length}");
//    return listOpsUP.length>0?listOpsUP:null;
//  }

  //dispose will be called automatically
  @override
  void dispose() {}


}
