import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../app_module.dart';
import 'loginbutton_controller.dart';
import 'widgets/rowlogin/rowlogin_widget.dart';
import 'widgets/rowlogout/rowlogout_widget.dart';

class LoginbuttonWidget extends StatefulWidget {
  @override
  _LoginbuttonWidgetState createState() => _LoginbuttonWidgetState();
}

class _LoginbuttonWidgetState extends State<LoginbuttonWidget>

{
    final controller = AppModule.to.get<LoginbuttonController>();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<String> user = controller.storage.read(key: "username");
    user.then((String user){
        if(user != null){
            setState(() {
              controller.logado = user;
            });
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return RowloginWidget();
          }
          if (!snapshot.hasData) {
            return RowloginWidget();
          }
          return _getOkC(context);
        });
  }

    _getOkC(context) {
        return Observer(
            builder: (_) {
                var user = controller.logado;
                if (user != "sem login") {
                    return RowlogoutWidget(user);
                }
                return RowloginWidget();
            }
        );
    }
}