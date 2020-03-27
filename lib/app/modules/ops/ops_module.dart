import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_web_mobx/app/modules/ops/ops_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eco_web_mobx/app/modules/ops/ops_page.dart';
import 'repositories/uploadcsv_interface.dart';
import 'repositories/uploadcsv_repository.dart';

class OpsModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind<IOpsRepository>(
            (i) => OpsRepository(Firestore.instance)),
        Bind((i) => OpsController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => OpsPage()),
      ];

  static Inject get to => Inject<OpsModule>.of();
}
