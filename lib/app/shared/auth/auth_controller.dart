import 'package:eco_web_mobx/app/shared/auth/repositories/auth_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {

  final IAuthRepository _authRepository = Modular.get();

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  FirebaseUser user;

  @action
  Future loginWithEmail() async {
    user = await _authRepository.getEmailLogin();
  }

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
    print("Auth ${user.email}");
  }

  Future logOut() {
    return _authRepository.getLogout();
  }


}

enum AuthStatus {
  loading,
  login,
  logoff
}
