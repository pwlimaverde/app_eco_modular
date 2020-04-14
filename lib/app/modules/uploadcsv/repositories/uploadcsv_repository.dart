import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'uploadcsv_interface.dart';


class UploadcsvRepository implements IUploadcsvRepository {
  final Firestore firestore;

  UploadcsvRepository(this.firestore);

  @override
  Future upload(List<OpsModel> listOps) async {
    List<OpsModel> listOpsAnalitic = listOps;
    List<OpsModel> listOpsUP = [];

    for (OpsModel model in listOps) {
      DocumentReference docRef =
          firestore.collection("ops").document("${model.op}");
      DocumentSnapshot doc = await docRef.get();
      final exists = doc.exists;
      if (!exists) {
        listOpsUP.add(model);
        print("Ops nova - ${model.op}");
      }
    }

    if (listOpsUP.length > 0) {
      for (OpsModel model in listOpsUP) {
        firestore.collection("ops").document("${model.op}").setData({
          'cliente': model.cliente,
          'entrada': model.entrada,
          'entrega': model.entrega,
          'op': model.op,
          'orcamento': model.orcamento,
          'produzido': model.produzido,
          'quant': model.quant,
          'servico': model.servico,
          'valor': model.valor,
          'vendedor': model.vendedor,
          'entregue': model.entregue,
          'cancelada': model.cancelada,
          'obs': model.obs,
        });
      }
    }
    print("total listOpsUP - ${listOpsUP.length}");
    print("total listOpsAnalitic - ${listOpsAnalitic.length}");
//    List test = await firestore.collection("ops").getDocuments().then((query) => query.documents.toList());
//    print("doc - ${DateTime.fromMillisecondsSinceEpoch(test[0]['entrega'].seconds * 1000)} - ${test[0]['entrega'].seconds}");
    return listOpsUP.length > 0 ? listOpsUP : null;
  }

  @override
  Future upProd(OpsModel model) async{
    var now = DateTime.now();
    try{
      DocumentReference docRef = firestore.collection("ops").document("${model.op}");
      DocumentSnapshot doc = await docRef.get();
      if(doc.data['produzido'] != null && doc.data['entregue'] != null){
        return;
      }
      if(doc.data['produzido'] == null){
        model.reference.updateData({
          'produzido': now,
        });
      }else{
        model.reference.updateData({
          'entregue': now,
        });
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Future canProd(OpsModel model) async{
    try{
      DocumentReference docRef = firestore.collection("ops").document("${model.op}");
      DocumentSnapshot doc = await docRef.get();
      if(doc.data['cancelada'] == false){
        model.reference.updateData({
          'cancelada': true,
        });
      }else{
        model.reference.updateData({
          'cancelada': false,
        });
      }

    }catch(e){
      print(e);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
