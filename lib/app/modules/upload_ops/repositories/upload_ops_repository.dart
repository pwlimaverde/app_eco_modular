import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:firebase/firestore.dart';
import 'upload_ops_interface.dart';

class UploadOpsRepositoryok implements IUploadOpsRepositoryok{

  final Firestore firestore;

  UploadOpsRepositoryok(this.firestore);

  @override
  Stream<List<OpsModel>> getOps() {
    Firestore fbs = firestore;
    try {
      return fbs.collection("ops").onSnapshot.map((query) {
        return query.docs.map((doc) {
          return OpsModel.fromDocument(doc);
        });
      });
    } catch (e) {
      print("Erro => $e");
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}

}
