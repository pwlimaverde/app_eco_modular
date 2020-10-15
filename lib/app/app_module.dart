import 'package:eco_web_mobx/app/shared/auth/auth_controller.dart';
import 'package:eco_web_mobx/app/shared/auth/repositories/auth_reposirory.dart';
import 'package:eco_web_mobx/app/shared/splash/splash_page.dart';
import 'package:eco_web_mobx/app/shared/widgets/opslist/opslist_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/right/right_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/menu/menu_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/header/header_controller.dart';
import 'package:eco_web_mobx/app/shared/service/firebase/firebase_service.dart';
import 'package:eco_web_mobx/app/shared/global/shared_preferences/prefs_service.dart';
import 'package:eco_web_mobx/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:eco_web_mobx/app/app_widget.dart';
import 'package:eco_web_mobx/app/modules/home/home_module.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'modules/login/login_module.dart';
import 'modules/ops/ops_module.dart';
import 'modules/pcp/pcp_module.dart';
import 'modules/planejamento/planejamento_module.dart';
import 'modules/uploadcsv/uploadcsv_module.dart';
import 'shared/auth/repositories/auth_interface.dart';
import 'shared/global/loginbutton/loginbutton_controller.dart';
import 'shared/global/menudrawer/menudrawer_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
        Bind((i) => OpslistController()),
        Bind((i) => RightController()),
        Bind((i) => MenuController()),
        Bind((i) => HeaderController()),
        Bind((i) => FirebaseService()),
        Bind((i) => PrefsService()),
        Bind((i) => AppController()),
        Bind((i) => LoginbuttonController()),
        Bind((i) => MenudrawerController()),
        Bind((i) =>
            HasuraConnect('https://sistemaecoprint.herokuapp.com/v1/graphql')),
      ];

  @override
  List<ModularRouter> get routers => [
//        ModularRouter('/', child: (_, args) => SplashPage()),
//        ModularRouter('/login', module: LoginModule(), transition: TransitionType.noTransition),
        ModularRouter('/',
            module: HomeModule(), transition: TransitionType.noTransition),
        ModularRouter('/upload',
            module: UploadcsvModule(), transition: TransitionType.noTransition),
        ModularRouter('/ops',
            module: OpsModule(), transition: TransitionType.noTransition),
        ModularRouter('/pcp',
            module: PcpModule(), transition: TransitionType.noTransition),
        ModularRouter('/planejamento',
            module: PlanejamentoModule(),
            transition: TransitionType.noTransition),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
