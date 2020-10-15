import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IOpsRepository extends Disposable {
  Stream<List<OpsModel>> getOpsAll();
  Stream<List<OpsModel>> getOpsArteFinal();
  Stream<List<OpsModel>> getOpsProd();
  Stream<List<OpsModel>> getOpsEnt();
  Future upProd(OpsModel model);
  Future upInfo(OpsModel model);
  Future canProd(OpsModel model);
}
