import 'package:flutter/material.dart';
import 'package:eco_web_mobx/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/privado/firebasewebdb.dart';


void main() {
  initFirebase();
  runApp(ModularApp(module: AppModule()));
}
