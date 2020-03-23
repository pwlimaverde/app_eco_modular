import 'package:eco_web_mobx/app/modules/upload_ops/repositories/upload_ops_repository.dart';
import 'package:eco_web_mobx/app/app_module.dart';
import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_repository.dart';
import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_controller.dart';
import 'package:eco_web_mobx/app/shared/service/firebase/firebase_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_page.dart';

class UploadOpsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UploadOpsRepositoryok(
              AppModule.to.get<FirebaseService>().initFirebase(),
            )),
        Bind((i) => UploadOpsRepository()),
        Bind((i) => UploadOpsController(
              AppModule.to.get<FirebaseService>().initFirebase(),
            )),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => UploadOpsPage()),
      ];

  static Inject get to => Inject<UploadOpsModule>.of();
}
