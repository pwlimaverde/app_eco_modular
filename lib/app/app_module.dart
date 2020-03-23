import 'package:eco_web_mobx/app/shared/service/firebase/firebase_service.dart';
import 'package:eco_web_mobx/app/shared/global/shared_preferences/prefs_service.dart';
import 'package:eco_web_mobx/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:eco_web_mobx/app/app_widget.dart';
import 'package:eco_web_mobx/app/modules/home/home_module.dart';
import 'modules/upload_ops/upload_ops_module.dart';
import 'shared/global/loginbutton/loginbutton_controller.dart';
import 'shared/global/menudrawer/menudrawer_controller.dart';
import 'shared/modules/login/login_controller.dart';
import 'shared/modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseService()),
        Bind((i) => PrefsService()),
        Bind((i) => AppController()),
        Bind((i) => LoginbuttonController()),
        Bind((i) => MenudrawerController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/upload', module: UploadOpsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
