import 'package:eco_web_mobx/app/shared/global/shared_preferences/prefs_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pcp_controller.dart';
import 'pcp_page.dart';
import 'repositories/pcp_hasura_repository.dart';
import 'repositories/pcp_interface.dart';


class PcpModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPcpRepository>((i) => PcpHasuraRepository(i.get())),
//        Bind<IOpsRepository>((i) => OpsFirebaseRepository(Firestore.instance)),
        Bind((i) => PcpController(i.get(), Modular.get<PrefsService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PcpPage()),
      ];

  static Inject get to => Inject<PcpModule>.of();
}
