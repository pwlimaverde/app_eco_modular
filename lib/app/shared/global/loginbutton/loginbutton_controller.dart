import 'package:eco_web_mobx/app/shared/global/shared_preferences/prefs_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import '../../../app_module.dart';
part 'loginbutton_controller.g.dart';

class LoginbuttonController = _LoginbuttonBase with _$LoginbuttonController;

abstract class _LoginbuttonBase with Store {

  final storage = FlutterSecureStorage();
  final prefsLogin = AppModule.to.get<PrefsService>();

  @observable
  String logado = "sem login";

  @action
  getData() async {
    String login = await storage.read(key: "username");
    return login;
  }

  @action
  logout() async {
    prefsLogin.remove("username");
    prefsLogin.remove("token");
    prefsLogin.remove("password");
    logado = "sem login";
  }

  @action
  addNovoLogin() async {
    logado = await prefsLogin.getString("username");
  }

}
