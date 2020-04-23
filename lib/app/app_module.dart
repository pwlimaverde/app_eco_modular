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
import 'modules/login/login_module.dart';
import 'modules/ops/ops_module.dart';
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
      ];

  @override
  List<Router> get routers => [
//        Router('/', child: (_, args) => SplashPage()),
//        Router('/login', module: LoginModule(), transition: TransitionType.noTransition),
        Router('/', module: HomeModule(), transition: TransitionType.noTransition),
        Router('/upload',
            module: UploadcsvModule(), transition: TransitionType.noTransition),
        Router('/ops',
            module: OpsModule(), transition: TransitionType.noTransition),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
