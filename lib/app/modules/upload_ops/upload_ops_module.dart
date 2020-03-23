import 'package:eco_web_mobx/app/app_module.dart';
import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_controller.dart';
import 'package:eco_web_mobx/app/shared/service/firebase/firebase_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_page.dart';
import 'repositories/upload_ops_interface.dart';
import 'repositories/upload_ops_repository.dart';

class UploadOpsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUploadOpsRepository>((i) => UploadOpsRepository(AppModule.to.get<FirebaseService>().initFirebase())),
        Bind((i) => UploadOpsController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => UploadOpsPage()),
      ];

  static Inject get to => Inject<UploadOpsModule>.of();
}
