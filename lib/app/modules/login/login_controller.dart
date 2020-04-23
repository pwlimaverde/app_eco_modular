import 'package:eco_web_mobx/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  AuthController auth = Modular.get();


  @observable
  bool loading = false;

  @action
  Future loginWithEmail() async{
    try{
      print("inicio");
      loading = true;
      await auth.loginWithEmail();
      print("login");
      Modular.to.pushReplacementNamed('/home');
      print("fim");
    }catch(e){
      loading = false;
      print("erro - $e");

    }
  }

  logoff(){
    auth.logOut();
    Modular.to.pushReplacementNamed('/login');
  }

}
