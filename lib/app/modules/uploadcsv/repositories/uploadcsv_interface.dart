import 'package:flutter_modular/flutter_modular.dart';
import '../model/ops_model.dart';

abstract class IUploadcsvRepository extends Disposable{
  Future upload(List<OpsModel> listOps);
}