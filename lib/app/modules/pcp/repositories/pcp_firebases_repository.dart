import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_web_mobx/app/shared/auth/auth_controller.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pcp_interface.dart';



class PcpFirebaseRepository implements IPcpRepository {

  final Firestore firestore;
  PcpFirebaseRepository(this.firestore);

  final auth = Modular.get<AuthController>();



  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Stream<List<OpsModel>> testeHasura() {
    // TODO: implement testeHasura
    throw UnimplementedError();
  }

  @override
  Future canProd(OpsModel model) {
    // TODO: implement canProd
    throw UnimplementedError();
  }

  @override
  Stream<List<OpsModel>> getOpsFlexo() {
    // TODO: implement getOpsFlexo
    throw UnimplementedError();
  }

  @override
  Stream<List<OpsModel>> getOpsRyobi() {
    // TODO: implement getOpsRyobi
    throw UnimplementedError();
  }

  @override
  Stream<List<OpsModel>> getOpsSm2c() {
    // TODO: implement getOpsSm2c
    throw UnimplementedError();
  }

  @override
  Stream<List<OpsModel>> getOpsSm4c() {
    // TODO: implement getOpsSm4c
    throw UnimplementedError();
  }

  @override
  Future upInfo(OpsModel model) {
    // TODO: implement upInfo
    throw UnimplementedError();
  }

  @override
  Future upImp(OpsModel model) {
    // TODO: implement upProd
    throw UnimplementedError();
  }

  @override
  Future upOrder(List<OpsModel> list) {
    // TODO: implement upOrder
    throw UnimplementedError();
  }



}
