import 'dart:convert' as convert;
import 'dart:html';
import 'package:dio/dio.dart';
import 'package:eco_web_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import '../../app_module.dart';

class UploadOpsRepository extends Disposable {
  final controllerLogin = AppModule.to.get<LoginbuttonController>();

  Future upOps(context, String base64) async {
    try {
      var url = BASE_URLW;
      var urlUp = UPLOADOPS_URL;
      var header = {
        "Authorization":
            "Token ${await controllerLogin.prefsLogin.getString("token")}",
//        "Content-type": "application/json",
      };

      dynamic bytes = convert.base64.decode(base64);

//      var params = {
//        "arquivo": base64,
//        "descricao": "teste",
//      };

//      String json = convert.jsonEncode(params);

      FormData formData = FormData.fromMap({
        "descricao": "teste",
        "arquivo": await MultipartFile.fromFile(bytes,filename: "upload.xml"),
      });

//      var response = await dio.post(url + urlUp, headers: header, data: formData);

      var response = await http.post(url + urlUp, headers: header, body: formData);

      if (response.statusCode == 200) {
        return print("foi");
      }

      print("erro 200");
      print(response.body);
    } catch (e) {
      print("erro $e");
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
