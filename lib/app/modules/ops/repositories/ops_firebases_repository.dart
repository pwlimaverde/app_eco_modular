import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_web_mobx/app/shared/auth/auth_controller.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'ops_interface.dart';

class OpsFirebaseRepository implements IOpsRepository {
  final Firestore firestore;
  OpsFirebaseRepository(this.firestore);

  final auth = Modular.get<AuthController>();

  @override
  Future upProd(OpsModel model) async {
    var now = DateTime.now();
    try {
      DocumentReference docRef =
          firestore.collection("ops").document("${model.op}");
      DocumentSnapshot doc = await docRef.get();
      if (doc.data['produzido'] != null && doc.data['entregue'] != null) {
        return;
      }
      if (doc.data['produzido'] == null) {
        model.reference.updateData({
          'produzido': now,
        });
      } else {
        model.reference.updateData({
          'entregue': now,
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future upInfo(OpsModel model) async {
    try {
      DocumentReference docRef =
          firestore.collection("ops").document("${model.op}");
      DocumentSnapshot doc = await docRef.get();
      model.reference.updateData({
        'obs': model.obs,
        'entrega': model.entrega,
        'ryobi': model.ryobi,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future canProd(OpsModel model) async {
    try {
      DocumentReference docRef =
          firestore.collection("ops").document("${model.op}");
      DocumentSnapshot doc = await docRef.get();
      if (doc.data['cancelada'] == false) {
        model.reference.updateData({
          'cancelada': true,
        });
      } else {
        model.reference.updateData({
          'cancelada': false,
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<List<OpsModel>> getOpsAll() {
    return firestore
        .collection("ops")
        .orderBy('op', descending: true)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return OpsModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsProd() {
    return firestore
        .collection("ops")
        .orderBy('entrega')
        .snapshots()
        .map((query) {
      return query.documents
          .where((doc) =>
              doc['cancelada'] == false &&
              doc['produzido'] == null &&
              doc['entregue'] == null)
          .map((doc) {
        return OpsModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsEnt() {
    return firestore
        .collection("ops")
        .orderBy('entrega')
        .snapshots()
        .map((query) {
      return query.documents
          .where((doc) =>
              doc['cancelada'] == false &&
              doc['produzido'] != null &&
              doc['entregue'] == null)
          .map((doc) {
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

  @override
  Stream<List<OpsModel>> testeHasura() {
    // TODO: implement testeHasura
    throw UnimplementedError();
  }

  @override
  Stream<List<OpsModel>> getOpsArteFinal() {
    // TODO: implement getOpsArteFinal
    throw UnimplementedError();
  }
}
