import 'package:eco_web_mobx/app/shared/service/firebase/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {
//  final FirebaseService firebase;
//
//  _AppBase(this.firebase) {
//    firebase.initFirebase();
//  }

  bool get showMenu => size.width <= 1080;

  @observable
  Orientation orientation;

  @observable
  Size size;

  @action
  getQuery(context) {
    size = MediaQuery.of(context).size;
    orientation = MediaQuery.of(context).orientation;
  }
}
