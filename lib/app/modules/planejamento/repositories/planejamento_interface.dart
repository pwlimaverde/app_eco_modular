import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter_modular/flutter_modular.dart';


abstract class IPlanejamentoRepository extends Disposable{
  Stream<List<OpsModel>> getOpsEstoque();
  Stream<List<OpsModel>> getOpsDesigner();
  Stream<List<OpsModel>> getOpsArteFinal();
  Future upProd(OpsModel model);
  Future upInfo(OpsModel model);
  Future canProd(OpsModel model);
}