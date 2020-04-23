import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_web_mobx/app/modules/ops/ops_controller.dart';
import 'package:eco_web_mobx/app/shared/global/shared_preferences/prefs_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eco_web_mobx/app/modules/ops/ops_page.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'repositories/ops_hasura_repository.dart';
import 'repositories/ops_interface.dart';
import 'repositories/op_firebases_repository.dart';

class OpsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IOpsRepository>((i) => OpsHasuraRepository(i.get())),
//        Bind<IOpsRepository>((i) => OpsFirebaseRepository(Firestore.instance)),
        Bind((i) => OpsController(i.get(), Modular.get<PrefsService>())),
        Bind((i) => HasuraConnect('https://sistemaecoprint.herokuapp.com/v1/graphql')),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => OpsPage()),
      ];

  static Inject get to => Inject<OpsModule>.of();
}
