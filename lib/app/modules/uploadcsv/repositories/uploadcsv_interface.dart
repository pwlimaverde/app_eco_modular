import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IUploadcsvRepository extends Disposable{
  Future upload(List<OpsModel> listOps);
  Future upProd(OpsModel model);
  Future canProd(OpsModel model);
}