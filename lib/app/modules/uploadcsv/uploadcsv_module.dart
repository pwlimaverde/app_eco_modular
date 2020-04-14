import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_web_mobx/app/modules/ops/ops_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'repositories/uploadcsv_interface.dart';
import 'repositories/uploadcsv_repository.dart';
import 'uploadcsv_controller.dart';
import 'uploadcsv_page.dart';

class UploadcsvModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUploadcsvRepository>(
            (i) => UploadcsvRepository(Firestore.instance)),
        Bind((i) => UploadcsvController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => UploadcsvPage()),
      ];

  static Inject get to => Inject<UploadcsvModule>.of();
}
