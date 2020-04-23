import 'package:eco_web_mobx/app/shared/modules/login/login_repository.dart';
import 'package:eco_web_mobx/app/shared/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eco_web_mobx/app/shared/modules/login/login_page.dart';

import 'widgets/button/button_controller.dart';
import 'widgets/field/field_controller.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginRepository()),
        Bind((i) => LoginController()),
        Bind((i) => FieldController()),
        Bind((i) => ButtonController(LoginModule.to.get<LoginRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
