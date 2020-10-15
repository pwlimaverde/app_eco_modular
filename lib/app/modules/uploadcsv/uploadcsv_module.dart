import 'package:eco_web_mobx/app/modules/uploadcsv/repositories/uploadcsv_hasura_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_web_mobx/app/modules/ops/ops_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'repositories/uploadcsv_interface.dart';
import 'repositories/uploadcsv_firebase_repository.dart';
import 'uploadcsv_controller.dart';
import 'uploadcsv_page.dart';

class UploadcsvModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUploadcsvRepository>((i) => UploadcsvHasuraRepository(i.get())),
//        Bind<IUploadcsvRepository>(
//            (i) => UploadcsvFirebaseRepository(Firestore.instance)),
        Bind((i) => UploadcsvController(i.get())),
        Bind((i) =>
            HasuraConnect('https://sistemaecoprint.herokuapp.com/v1/graphql')),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => UploadcsvPage()),
      ];

  static Inject get to => Inject<UploadcsvModule>.of();
}
