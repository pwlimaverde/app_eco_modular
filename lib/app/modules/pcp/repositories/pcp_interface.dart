import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter_modular/flutter_modular.dart';


abstract class IPcpRepository extends Disposable{
  Stream<List<OpsModel>> getOpsRyobi();
  Stream<List<OpsModel>> getOpsSm2c();
  Stream<List<OpsModel>> getOpsSm4c();
  Stream<List<OpsModel>> getOpsFlexo();
  Future upImp(OpsModel model);
  Future upInfo(OpsModel model);
  Future canProd(OpsModel model);
}