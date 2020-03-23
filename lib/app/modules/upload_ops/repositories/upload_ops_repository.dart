import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:firebase/firestore.dart';
import 'upload_ops_interface.dart';

class UploadOpsRepository implements IUploadOpsRepository{

  final Firestore firestore;

  UploadOpsRepository(this.firestore);


  @override
  Stream<List<OpsModel>> getOps() {
      return firestore.collection("ops").onSnapshot.map((query) {
        return query.docs.map((doc) {
          return OpsModel.fromDocument(doc);
        }).toList();
      });
  }

//  Future upOps(context, String base64) async {
//    try {
//      var url = BASE_URLW;
//      var urlUp = UPLOADOPS_URL;
//      var header = {
//        "Authorization":
//        "Token ${await controllerLogin.prefsLogin.getString("token")}",
//      };
//
//      dynamic bytes = convert.base64.decode(base64);
//
//
//      var response = await http.post(url + urlUp, headers: header, body: formData);
//
//      if (response.statusCode == 200) {
//        return print("foi");
//      }
//
//      print("erro 200");
//      print(response.body);
//    } catch (e) {
//      print("erro $e");
//    }
//  }

  //dispose will be called automatically
  @override
  void dispose() {}

}
