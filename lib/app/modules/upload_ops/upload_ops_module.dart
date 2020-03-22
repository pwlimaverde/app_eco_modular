import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_repository.dart';
import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:eco_web_mobx/app/modules/upload_ops/upload_ops_page.dart';

class UploadOpsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UploadOpsRepository()),
        Bind((i) => UploadOpsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => UploadOpsPage()),
      ];

  static Inject get to => Inject<UploadOpsModule>.of();
}
