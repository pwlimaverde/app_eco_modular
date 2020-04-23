import 'package:eco_web_mobx/app/modules/ops/repositories/documents/ops_document.dart';
import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'ops_interface.dart';

class OpsHasuraRepository implements IOpsRepository {

  final HasuraConnect connect;

  OpsHasuraRepository(this.connect);


  @override
  Future canProd(OpsModel model) {
    // TODO: implement canProd
    throw UnimplementedError();
  }

  @override
  Stream<List<OpsModel>> getOpsAll() {
    return connect.subscription(opsAllQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsEnt() {
    return connect.subscription(opsEntQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Stream<List<OpsModel>> getOpsProd() {
    return connect.subscription(opsProdQuery).map((event) {
      return (event['data']['ops'] as List).map((json) {
        return OpsModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Future upInfo(OpsModel model) {
    // TODO: implement upInfo
    throw UnimplementedError();
  }

  @override
  Future upProd(OpsModel model) {
    // TODO: implement upProd
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}
