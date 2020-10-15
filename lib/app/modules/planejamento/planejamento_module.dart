import 'planejamento_controller.dart';
import 'planejamento_page.dart';
import 'package:eco_web_mobx/app/shared/global/shared_preferences/prefs_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'repositories/planejamento_hasura_repository.dart';
import 'repositories/planejamento_interface.dart';

class PlanejamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPlanejamentoRepository>(
            (i) => PlanejamentoHasuraRepository(i.get())),
//        Bind<IOpsRepository>((i) => OpsFirebaseRepository(Firestore.instance)),
        Bind((i) =>
            PlanejamentoController(i.get(), Modular.get<PrefsService>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PlanejamentoPage()),
      ];

  static Inject get to => Inject<PlanejamentoModule>.of();
}
