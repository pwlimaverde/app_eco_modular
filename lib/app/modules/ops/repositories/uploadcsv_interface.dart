import 'package:flutter_modular/flutter_modular.dart';
import '../model/ops_model.dart';

abstract class IOpsRepository extends Disposable{
  Stream<List<OpsModel>> getOps();
  Future upProd(OpsModel model);
  Future upEnt(OpsModel model);
  Future canProd(OpsModel model);
  Future atProd(OpsModel model);
}