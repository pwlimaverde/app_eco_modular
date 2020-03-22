import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../utilitario/alert.dart';
import '../../utilitario/api_response.dart';
import '../../login_controller.dart';
import '../../login_module.dart';
import '../../login_repository.dart';
part 'button_controller.g.dart';


class ButtonController = _ButtonBase with _$ButtonController;

abstract class _ButtonBase with Store {

    final controller = LoginModule.to.get<LoginController>();
    final LoginRepository repo;

  _ButtonBase(this.repo);

    Future<void> clicButton(context) async {

        bool formOk = controller.formKey.currentState.validate();
        if (!formOk) {
            return;
        }

        String username = controller.crtlLogin.text;
        String password = controller.crtlSenha.text;

        ApiResponse usuarioLogado = await repo.loginUsers(context, username, password);
        if (!usuarioLogado.ok) {
            return alertLogin(context, "Login Inválido - ${usuarioLogado.msg}");
        }
        Navigator.pop(context);
    }
}
