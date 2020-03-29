import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_web_mobx/app/modules/ops/ops_controller.dart';
import 'package:eco_web_mobx/app/shared/global/shared_preferences/prefs_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eco_web_mobx/app/modules/ops/ops_page.dart';
import '../../app_module.dart';
import 'repositories/ops_interface.dart';
import 'repositories/ops_repository.dart';

class OpsModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IOpsRepository>(
            (i) => OpsRepository(Firestore.instance)),
        Bind((i) => OpsController(i.get(), Modular.get<PrefsService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => OpsPage()),
      ];

  static Inject get to => Inject<OpsModule>.of();
}
